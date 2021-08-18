import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoder/geocoder.dart';
import 'package:latlong/latlong.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WE Drive work',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Drive project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double long = 49.5;
  double lat = -0.09;
  LatLng point = LatLng(49.5, -0.09);
  var location = [];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
              onTap: (p) async {
                location = await Geocoder.local.findAddressesFromCoordinates(
                    new Coordinates(p.latitude, p.longitude));
                setState(() {
                  point = p;
                  print(p);
                });
                print("${location.first.countryName}");
              },
              center: LatLng(49.5, -0.09), //나중에 설정하자 자기위치
              zoom: 10.0),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: point,
                  builder: (ctx) => Container(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
