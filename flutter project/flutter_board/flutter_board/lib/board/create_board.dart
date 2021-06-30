import 'package:flutter/material.dart';

class CreateBoard extends StatefulWidget {
  const CreateBoard({Key key}) : super(key: key);

  @override
  _CreateBoardState createState() => _CreateBoardState();
}

class _CreateBoardState extends State<CreateBoard> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController boardController = TextEditingController();

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
              onPressed: () {
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
                          TextField(
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
