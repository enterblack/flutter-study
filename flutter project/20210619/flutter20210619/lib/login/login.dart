import 'package:flutter/material.dart';
// import 'package:flutter20210619/main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Login Test"),
          elevation: 0.0,
        ),
        body: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 30.0)),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                    ),
                    Center(
                      child: Image(
                        image: AssetImage("images/chef.gif"),
                        width: 170.0,
                        height: 190.0,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Padding(padding: EdgeInsets.all(30.0)),
                        Container(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              TextField(
                                controller: idController,
                                decoration: InputDecoration(labelText: "ID"),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              //ID input
                              TextField(
                                controller: pwController,
                                decoration: InputDecoration(labelText: "PW"),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                              //PW input
                              SizedBox(
                                height: 60.0,
                              ),
                              ButtonTheme(
                                minWidth: 100.0,
                                height: 50.0,
                                child: ElevatedButton.icon(
                                    onPressed: () {
                                      //아이디랑 비밀번호를 firebase으로 전송을 해서
                                      //서버에 저장된 데이터로 판독을 하고
                                      //그 결과에 따라 로그인이 성공하면 대화목록 창으로 이동
                                      //아니면 그 로그인 오류 발생
                                      //인터넷 문제가 발생을 하면 인터넷 오류 발생
                                    },
                                    icon: Icon(
                                      Icons.home,
                                      size: 20.0,
                                    ),
                                    label: Text("login")),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
