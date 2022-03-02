import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drive/models/main.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class Firestore {
  static CollectionReference<Profile> users() {
    return firestore.collection("users").withConverter<Profile>(
        fromFirestore: (doc, b) {
      final data = doc.data()!;
      return Profile(User(doc.id, data["name"], data["avatar"]),
          DateTime.parse(data["lastChanged"]), data["size"]);
    }, toFirestore: (data, val) {
      return {
        "name": data.name,
        "size": data.size,
        "lastChange": data.lastChange,
        "avatar": data.avatar,
      };
    });
  }
}
