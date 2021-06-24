import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // collection reference
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brews");

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      "sugers": sugars,
      "name": name,
      "strength": strength,
    });
  }
}
