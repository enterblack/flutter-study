import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  List<dynamic> location;
  ResultScreen({required this.location});

  @override
  Widget build(BuildContext context) {
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
                      children: [Text("1"), Text("2")],
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
