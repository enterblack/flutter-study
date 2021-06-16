import 'package:flutter/material.dart';
import 'package:flutter210616/screens/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Loading(),
    );
  }
}

