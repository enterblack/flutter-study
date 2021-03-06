import 'package:brew_crew/screens/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_auth/firebase_auth.dart' as firebase show User;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Stream.value(User()),
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
