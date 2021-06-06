import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScreenA"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/b");
              },
              child: Text("Go to ScreenB"),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/c");
              },
              child: Text("Go to ScreenC"),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
