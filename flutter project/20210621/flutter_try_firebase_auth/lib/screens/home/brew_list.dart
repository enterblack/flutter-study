import 'package:flutter/material.dart';
import 'package:flutter_try_firebase_auth/models/brew.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context);

    //print(brews.docs);
    if (brews != null) {
      brews.forEach((brew) {
        print(brew.name);
        print(brew.sugars);
        print(brew.strength);
      });
    }
    return Container();
    //현재 버전업에 따라서 정보가 출력되지 않고 있음
  }
}
