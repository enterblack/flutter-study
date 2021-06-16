import 'package:flutter/material.dart';

class ScreenC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScreenC"),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.redAccent,
          child: Text("Go to Screen A"),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ),
    );
  }
}
