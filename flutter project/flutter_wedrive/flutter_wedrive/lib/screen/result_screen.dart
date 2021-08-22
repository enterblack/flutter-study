import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  List<dynamic> location;
  List<double> distance;
  Duration tempDuration;
  ResultScreen(
      {required this.location,
      required this.distance,
      required this.tempDuration});

  @override
  Widget build(BuildContext context) {
    var addDistance = 0.0;
    List timer = [];
    for (int i = 0; i < location.length; i++) {
      var index = location[i].split(", ");
      timer.add(index[4]);
    }
    for (int i = 0; i < distance.length; i++) {
      addDistance = addDistance + distance[i];
    }
    addDistance = addDistance / 1000; //Meter to KiloMeter
    var addDistanceStr = addDistance.toStringAsFixed(2);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("이동완료",
                    style: TextStyle(
                        color: Colors.black,
                        backgroundColor: Colors.grey,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold)),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      size: 45.0,
                    ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 500.0,
                  child: ListView.builder(
                    itemCount: location.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 30,
                        child: Center(
                          child: Text(location[index].toString(),
                              style: TextStyle(fontSize: 20.0)),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 100,
                  width: 200,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "총 이동거리 : $addDistanceStr KM",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                        Text(
                          "총 이동시간 : " + tempDuration.inSeconds.toString() + "초",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
