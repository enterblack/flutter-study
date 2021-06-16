import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  String url = "https://eunjin3786.pythonanywhere.com/question/all";
  var response = await http.get(url);
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  var responseBody = response.body;

  print("statusCode: ${statusCode}");
  print("responseHeaders: ${responseHeaders}");
  print("responseBody: ${responseBody}");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Server test',
      home: Json(),
    );
  }
}

class Json extends StatefulWidget {
  const Json({Key key}) : super(key: key);

  @override
  _JsonState createState() => _JsonState();
}

class _JsonState extends State<Json> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
    );
  }
}
