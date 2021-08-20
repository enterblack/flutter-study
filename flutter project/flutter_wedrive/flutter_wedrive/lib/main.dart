import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_wedrive/screen/result_screen.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:flutter_wedrive/data/my_location.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'dart:async';

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
  static const countdownDuration = Duration(minutes: 10);
  Duration duration = Duration();
  Timer? timer;
  bool isNotStart = true;
  bool isCountdown = false;
  int initInt = 1;
  double startLatitude = 37.4236, startLongitude = 126.6965;
  List<dynamic> location = ["0, 37.4236, 126.6965, 0, 0"];
  @override
  void initState() {
    super.initState();
    isNotStart = true;

    reset();
  }

  void reset() {
    if (isCountdown) {
      setState(() {
        duration = countdownDuration;
      });
    } else {
      setState(() {
        duration = Duration();
      });
    }
  }

  void resetTimer() {
    reset();
    setState(() {
      timer?.cancel();
    });
  }

  void startTimer() {
    reset();

    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;
    //countdown을 하면 1초당 -1씩 증가를 한다 그런데 이 어플은 증가만 하니까 항상 false
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  LatLng point = LatLng(37.4236, 126.6965);
  //현재 자신의 위치를 가져오기 너무 힘들다 일단 다른거 부터 하자
  var startButtonText = "기록시작하기";

  @override
  Widget build(BuildContext context) {
    //build 안에서 다른변수에 값을 넣어야한다!! 띠용!
    // LatLng point = LatLng(latitude, longitude);
    //여기서 호출해버리면 고정이 되버린다...
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
              onTap: (p) async {
                //조건을 걸어서 지도를 탭할 수 있게 만들어야한다.
                if (isNotStart) {
                  //do not anything
                } else {
                  setState(() {
                    point = p;
                    print(p);
                  });

                  double distance = Geolocator.distanceBetween(
                      startLatitude, startLongitude, p.latitude, p.longitude);
                  distance = distance / duration.inSeconds; // 거리가 아니고 속도임

                  location.add(initInt.toString() +
                      ", " +
                      p.latitude.toStringAsFixed(2) +
                      ", " +
                      p.longitude.toStringAsFixed(2) +
                      ", " +
                      distance.toStringAsFixed(2) +
                      ", " +
                      "time!");

                  print(location.last);
                  startLatitude = p.latitude;
                  startLongitude = p.longitude;
                  initInt++;
                }
              },
              //center에서 현재 위치를 가져온것을 받게 만들어야됨
              center: LatLng(37.4236, 126.6965), //아 화면센터!
              zoom: 14.0),
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
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Card(
                  color: Colors.white.withOpacity(0.0),
                  child: Center(
                      child: isNotStart
                          ? Text(
                              "준비중",
                              style: TextStyle(fontSize: 25.0),
                            )
                          : buildTime()),
                  //이건 진짜 쩐다 3항식
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    child: Text(startButtonText),
                    onPressed: () {
                      if (isNotStart) {
                        setState(() {
                          startButtonText = "기록 완료하기";
                          startTimer();
                        });
                        isNotStart = false;
                      } else {
                        //팝업창 뜨고 저장한 일련번호, 경도, 위도, 속도, 시간 띄움
                        //일단 팝업창 뜨면됨
                        //
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                location: location,
                              ),
                            ));
                        setState(() {
                          startButtonText = "기록 시작하기";
                          resetTimer();
                        });
                        isNotStart = true;
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

//타이머 출처
//https://www.youtube.com/watch?v=Bw6zc1nncyA&ab_channel=JohannesMilke
  void recode(double latitude, double longitude) {}
  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours.remainder(60));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Text(
      '$hours:$minutes:$seconds',
      style: TextStyle(
          fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.blue),
    );
  }
}
