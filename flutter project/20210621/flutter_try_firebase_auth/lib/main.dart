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
    // final brews = Provider.of<List<Brew>?>(context);
    return StreamProvider<Auser?>.value(
      value: AuthService().user,
      initialData: null,
      //현재 오류가 발생한 지점인데 디버그 콘솔에서는 하라대로 하긴 했는데
      //잘 해결이 안되고 있고 현재 빨간 화면만 출력되고 오류문이 많이 있다
      //일단 주석으로 오류들을 올림
// ════════ Exception caught by widgets library ═══════════════════════════════════
// The following ProviderNotFoundException was thrown building Builder(dirty):
// Error: Could not find the correct Provider<Auser> above this Builder Widget

// This happens because you used a `BuildContext` that does not include the provider
// of your choice. There are a few common scenarios:

// - You added a new provider in your `main.dart` and performed a hot-reload.
//   To fix, perform a hot-restart.

// - The provider you are trying to read is in a different route.

//   Providers are "scoped". So if you insert of provider inside a route, then
//   other routes will not be able to access that provider.

// - You used a `BuildContext` that is an ancestor of the provider you are trying to read.

//   Make sure that Builder is under your MultiProvider/Provider<Auser>.

      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
