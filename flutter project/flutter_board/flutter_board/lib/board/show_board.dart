import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_board/board/create_board.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text(
          "anonymos board",
          style: TextStyle(color: Colors.blueAccent),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.playlist_add_outlined),
              iconSize: 40.0,
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => CreateBoard()));
                //여기서 이제 새로운 글쓰기로 넘어가기
                //글쓰기를 할때 자유롭게 익명으로 작성
                //중복 허용
                //그아이디입력 할때 비밀번호를 입력하게해서 수정이나 삭제시
                //비밀번호 요구 할 예정
                //익명 게시판
                // await _board.wirte();
              })
        ],
      ),
      body: Center(
        child: StreamBuilder(
          initialData: Text("데이터 없음"),
          stream: FirebaseFirestore.instance.collection('board').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text("Error: ${snapshot.error}");

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Text("Loading..");

              default:
                if (!snapshot.hasData) return Text("Laoding...");

                return new ListView.builder(itemBuilder: (context, index) {
                  return Container(
                    height: 600,
                    //높이를 높게 설정한 이유
                    //짧게 하면 데이터를 반복해서 보여준다 그래서
                    //반복하지 않게 출력을 하거나
                    //높이를 높게 만들어서 정상인것 처럼 만드는방법이 있는데
                    //현재 높이를 높게 만들었다 ;;;

                    child: ListView(
                      children: snapshot.data.docs.map<Widget>((document) {
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        return new ListTile(
                          title: new Text(
                            data['number'] + "번글 " + data['title'],
                            style:
                                TextStyle(color: Colors.black87, fontSize: 20),
                          ),
                          subtitle: new Text(
                            "ID  : " + data['id'] + "  " + data['time'],
                            style: TextStyle(color: Colors.blueAccent[200]),
                          ),
                          focusColor: Colors.lightBlueAccent,
                          hoverColor: Colors.red,
                          // onTap: ,
                        );
                      }).toList(),
                    ),
                  );
                });
              // return new ListView(
              //   children: snapshot.data.docs.map((DocumentSnapshot docment) {
              //     Map<String, dynamic> data =
              //         docment.data() as Map<String, dynamic>;
              //     return new ListTile(
              //       title: new Text(data["title"]),
              //       subtitle: new Text(data["id"]),
              //     );
              //   }).toList(),
              // );
            }
          },
        ),
      ),

      // body: Column(
      //   children: [
      //     Padding(padding: EdgeInsets.only(top: 30.0)),
      //     Center(
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         verticalDirection: VerticalDirection.down,
      //         children: [
      //           Text("번호"),
      //           SizedBox(
      //             width: 30.0,
      //           ),
      //           Text("제목"),
      //           SizedBox(
      //             width: 30.0,
      //           ),
      //           Text("작성자"),
      //           SizedBox(
      //             width: 30.0,
      //           ),
      //           Text("시간")
      //         ],
      //       ),
      //     ),

      //       //이제 여기에서 firebase에서 저장된 글들을 불러와야 됨 ㅎㅎ

      //       //어떻게 불러오는지는 내가 확인을 해야됨 ㅎㅎ
      //       //column등을 불러서 제목 / 등록일 / 등록 당시 아이디 출력

      //       //그리고 해당 글을 클릭할때 정보들을 보여주고 밑에다가
      //       //수정 및 삭제 버튼과 댓?글(만들까?) 생기고
      //       //해당하는 글의 비밀번호를 알아야지만 삭제 및 수정이 가능하게 만들기

      //   ],

      // ),
      backgroundColor: Colors.blue[50],
    );
  }
}
