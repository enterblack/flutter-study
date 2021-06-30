import 'package:flutter/material.dart';
import 'package:flutter_board/board/create_board.dart';
// import 'package:firebase_core/firebase_core.dart';
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
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 30.0)),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              children: [
                Text("번호"),
                SizedBox(
                  width: 30.0,
                ),
                Text("제목"),
                SizedBox(
                  width: 30.0,
                ),
                Text("작성자"),
                SizedBox(
                  width: 30.0,
                ),
                Text("시간")
              ],
            ),

            //이제 여기에서 firebase에서 저장된 글들을 불러와야 됨 ㅎㅎ

            //어떻게 불러오는지는 내가 확인을 해야됨 ㅎㅎ
            //column등을 불러서 제목 / 등록일 / 등록 당시 아이디 출력

            //그리고 해당 글을 클릭할때 정보들을 보여주고 밑에다가
            //수정 및 삭제 버튼과 댓?글(만들까?) 생기고
            //해당하는 글의 비밀번호를 알아야지만 삭제 및 수정이 가능하게 만들기
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("123")],
          )
        ],
      ),
      backgroundColor: Colors.blue[50],
    );
  }
}
