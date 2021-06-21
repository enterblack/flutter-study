import 'package:flutter/material.dart';
import 'package:flutter20210619/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth auth = FirebaseAuth.instance;

  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

// Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // // Show error message if initialization failed
    // if(_error) {
    //   return SomethingWentWrong();
    // }
    // 이부분은 초기화가 안됬을 경우 생기는 안내창을 만드는 부분
    // // Show a loader until FlutterFire is initialized
    // if (!_initialized) {
    //   return Loading();
    // }

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
                                      // FirebaseAuth.instance
                                      // .userChanges()
                                      // .listen((User? user) {
                                      //   if (user == null) {
                                      //     print('User is currently signed out!');
                                      //     } else {
                                      //       print('User is signed in!');
                                      //       }
                                      // });

                                      // try {
                                      //   UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                      //     email: "barry.allen@example.com",
                                      //     password: "SuperSecretPassword!"
                                      //   );
                                      // } on FirebaseAuthException catch (e) {
                                      //   if (e.code == 'user-not-found') {
                                      //     print('No user found for that email.');
                                      //   } else if (e.code == 'wrong-password') {
                                      //     print('Wrong password provided for that user.');
                                      //   }
                                      // }
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
