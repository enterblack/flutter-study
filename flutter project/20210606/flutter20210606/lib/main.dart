import 'package:flutter/material.dart';
import 'package:flutter20210606/ScreenA.dart';
import 'package:flutter20210606/ScreenB.dart';
import 'package:flutter20210606/ScreenC.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Navigator',
      initialRoute: '/',
      routes: {
        "/": (context) => ScreenA(),
        "/b": (context) => ScreenB(),
        "/c": (context) => ScreenC()
      },

      // home: MyPage(),
    );
  }
}

// class MyPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("First page"),
//       ),
//       body: Center(
//         child: TextButton(
//           child: Text("Go to the Second page"),
//           onPressed: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (BuildContext context) {
//               return SecondPage();
//               //hard coding! (위에있는게 )
//               //MaterialPageRoute(builder: (context) => SecondPage()));
//               //간단한 코딩!
//             }));
//           },
//         ),
//       ),
//     );
//   }
// }

// class SecondPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Second page"),
//       ),
//       body: Center(
//         child: TextButton(
//           child: Text("Go to the First page"),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }
// }
