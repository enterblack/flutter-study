import 'package:flutter/material.dart';
import 'package:flutter_try_firebase_auth/service/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_try_firebase_auth/warpper.dart';
import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      initialData: User(),
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
