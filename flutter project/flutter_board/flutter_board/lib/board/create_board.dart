import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateBoard extends StatefulWidget {
  // const CreateBoard({Key key}) : super(key: key);

  @override
  _CreateBoardState createState() => _CreateBoardState();
}

class _CreateBoardState extends State<CreateBoard> {
  // final String id;
  // final String pw;
  // final String number;
  // final String note;
  // final DateTime time;
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController boardController = TextEditingController();

  // _CreateBoardState{this.id, this.pw, this.number, this.note, this.time};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text(
          "anonymos board",
          style: TextStyle(color: Colors.blueAccent),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.check),
              iconSize: 40.0,
              color: Colors.blueAccent,
              onPressed: () async {
                if (idController.text.length < 2) {
                  showMinIdSnackBar(context);
                } else if (pwController.text.length < 4) {
                  showMinPwSnackBar(context);
                } else if (titleController.text.length < 2) {
                  showMinTitleSnackBar(context);
                } else if (boardController.text.isEmpty) {
                  showEmptyBoardSnackBar(context);
                } else {
                  //작성된 모든 문자열 데이터들을 firebase로 전송을 하게 하고
                  //작성된 페이지는 파괴를 하고 되돌아가기
                  showTestSendSnackBar(context); //Test Code
                  // createUserBoard();
                }
                //여기에도 작성버튼 만들어서 편의성 증대
              })
        ],
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            //키보드 패드를 사라지게 만드는 함수 (다른곳을 눌러서)
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Form(
                      child: Theme(
                    data: ThemeData(
                        inputDecorationTheme: InputDecorationTheme(
                            labelStyle:
                                TextStyle(color: Colors.teal, fontSize: 15.0))),
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: idController,
                            decoration: InputDecoration(
                                labelText: "Enter id(Min = 2, Max = 10)"),
                            maxLength: 10,
                            keyboardType: TextInputType.name,
                          ),
                          TextField(
                            controller: pwController,
                            decoration: InputDecoration(
                                labelText: "Enter pw(Min = 4, Max = 8)"),
                            maxLength: 8,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          TextField(
                            controller: titleController,
                            decoration:
                                InputDecoration(labelText: "Enter title"),
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                          ),
                          //글쓰는 부분은 그 메모장 같이 생긴걸로 하면 될듯
                          TextFormField(
                            controller: boardController,
                            decoration:
                                InputDecoration(labelText: "Enter board"),
                            keyboardType: TextInputType.text,
                          ),
                          ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    if (idController.text.length < 2) {
                                      showMinIdSnackBar(context);
                                    } else if (pwController.text.length < 4) {
                                      showMinPwSnackBar(context);
                                    } else if (titleController.text.length <
                                        2) {
                                      showMinTitleSnackBar(context);
                                    } else if (boardController.text.isEmpty) {
                                      showEmptyBoardSnackBar(context);
                                    } else {
                                      //작성된 모든 문자열 데이터들을 firebase로 전송을 하게 하고
                                      //작성된 페이지는 파괴를 하고 되돌아가기
                                      showTestSendSnackBar(context); //Test Code
                                      // createUserBoard();
                                      //일단 되는지만 확인해보고 되면은 Funtion화
                                      var now = DateTime.now();
                                      var formattedDate =
                                          DateFormat('yyyy-MM-dd').format(now);

                                      Query query = FirebaseFirestore.instance
                                          .collection('board')
                                          .orderBy('number', descending: true)
                                          .limit(1);
                                      var lastNumber =
                                          query.where('number').get();

                                      FirebaseFirestore.instance
                                          .collection('board')
                                          .add({
                                        'title': titleController.value.text
                                            .toString(),
                                        'id':
                                            idController.value.text.toString(),
                                        'pw':
                                            pwController.value.text.toString(),
                                        'note': boardController.value.text
                                            .toString(),
                                        'time': formattedDate.toString(),
                                        'realtime': now.toString(),
                                        // 'time': DateTime.now().toString(),
                                        'number': lastNumber.toString()

                                        //ㅇㅋ 이제 해야되는거는 가장큰 number를 가져와서
                                        //번호를 확인하고 1 더하고 다시 넣어주는 것이다!!

                                        //그리고 캡슐화 진행
                                      });
                                    }
                                  },
                                  icon: Icon(Icons.add),
                                  label: Text("")))
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.blue[50],
    );
  }
}

void createUserBoard(
    String id, String pw, String title, String note, String time) {
  // FirebaseFirestore.instance.doc().set(data);
  //title, id , pw , note, time
}

void showEmptyBoardSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      "INPUT Board",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

void showMinTitleSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      "INPUT TITLE 2 words",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

void showTestSendSnackBar(BuildContext context) {
  //Test Code
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      "Send Data!",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

void showMinIdSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      "INPUT ID 2 words",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

void showMinPwSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      "INPUT PW 4 words",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}
