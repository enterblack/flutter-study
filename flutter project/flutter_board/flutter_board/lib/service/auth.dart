import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_board/models/account.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FireBaseUser
  Account _userFromFirebaseUser(Account account) {
    return account != null ? Account(uid: account.uid) : null;
  }

  // // auth Change user stream
  // Stream<Account> get user {
  //   return _auth
  //       .authStateChanges()
  //       //.map((FirebaseUser user) => _userFromFirebaseUser(user));
  //       .map(_userFromFirebaseUser);
  // }

  // //sign in anon
  // Future signInAnon() async {
  //   try {
  //     UserCredential result = await _auth.signInAnonymously();
  //     User user = result.user;
  //     return _userFromFirebaseUser(user);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

}
