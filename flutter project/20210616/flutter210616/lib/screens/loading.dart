import 'package:flutter/material.dart';
import 'package:flutter210616/data/my_location.dart';
import 'package:flutter210616/data/network.dart';
import 'package:flutter210616/screens/weather_screen.dart';

const apikey = 'eb0bc55b9fa0bb30e4afdebaa6d7d502';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double latitude3;
  double longitude3;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMycurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric');
    var weatherData = await network.getJsonData();
    print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        parseWeatherData: weatherData,
      );
    }));
  }

  // void fetchData() async {

  //     var myJson = parsingData['weather'][0]['description'];
  //     print(myJson);
  //     var myJson1 = parsingData['wind']['speed'];
  //     print(myJson1);
  //     var myJson2 = parsingData['id'];
  //     print(myJson2);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: null,
          child: Text(
            "Get my location",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}
