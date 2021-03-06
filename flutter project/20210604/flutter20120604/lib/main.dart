import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Toast message",
      theme: ThemeData(primaryColor: Colors.blue),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toast message"),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            flutterToast();
          },
          child: Text("Toast"),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.blue),
              foregroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.red)),
        ),
      ),
    );
  }
}

void flutterToast() {
  Fluttertoast.showToast(
      msg: "Flutter",
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      fontSize: 20.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}
