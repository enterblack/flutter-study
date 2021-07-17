import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_board/board/show_board.dart';

class DetailScreen extends StatelessWidget {
  final String appbarTitle;
  final String id;
  final String note;
  DetailScreen({Key key, this.appbarTitle, this.id, this.note})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarTitle + id + note),
      ),
    );
  }
}
