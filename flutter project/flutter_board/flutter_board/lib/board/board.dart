import 'package:flutter/material.dart';
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
        child: Text("test board"),
        //이제 여기에서 firebase에서 저장된 글들을 불러와야 됨 ㅎㅎ
        //어떻게 불러오는지는 내가 확인을 해야됨 ㅎㅎ
        //column등을 불러서 제목 / 등록일 / 등록 당시 아이디 출력
      ),
      backgroundColor: Colors.blue[50],
    );
  }
}
