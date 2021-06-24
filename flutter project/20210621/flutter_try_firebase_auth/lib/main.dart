import 'package:flutter/material.dart';
import 'package:flutter_try_firebase_auth/service/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_try_firebase_auth/warpper.dart';
import 'models/Auser.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Auser>.value(
      value: AuthService().user,
      initialData: Auser(),
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
