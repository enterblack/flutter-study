import 'package:flutter/material.dart';
import 'package:flutter_try_firebase_auth/service/auth.dart';
import 'package:flutter_try_firebase_auth/service/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_try_firebase_auth/screens/home/brew_list.dart';
import 'package:flutter_try_firebase_auth/models/brew.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>?>.value(
      value: DatabaseService().brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Brew crew"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text("logout"),
                onPressed: () async {
                  await _auth.signOut();
                })
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
