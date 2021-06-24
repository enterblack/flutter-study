import 'package:flutter/material.dart';
import 'package:flutter_try_firebase_auth/screens/authenticate/authenticate.dart';
import 'package:flutter_try_firebase_auth/screens/home/home.dart';
import 'models/Auser.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auser>(context);

    // return either home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
