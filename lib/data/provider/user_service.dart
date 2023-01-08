import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testing_local_storage/data/model/user_model.dart';

DocumentReference get userCollection {
  return FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid);
}

class UserService {
  static createUserIfNotExists() async {
    var snapshot = await userCollection.get();
    if (!snapshot.exists) {
      await userCollection.set({
        "id": FirebaseAuth.instance.currentUser!.uid,
        "photo": FirebaseAuth.instance.currentUser!.photoURL,
        "email": FirebaseAuth.instance.currentUser!.email,
        "name": FirebaseAuth.instance.currentUser!.displayName,
        "point": 0,
      });
    }
  }

  static updatePoint({
    required int point,
  }) async {
    await userCollection.update({
      "point": FieldValue.increment(point),
    });
  }

  static getUserData() {
    return {
      "id": FirebaseAuth.instance.currentUser!.uid,
      "email": FirebaseAuth.instance.currentUser!.email,
      "name": FirebaseAuth.instance.currentUser!.displayName,
    };
  }

  static updateProfile(UserModel user) async {
    userCollection.set({
      "id": user.id,
      "photo": user.photo,
      "email": user.email,
      "name": user.name,
      "point": user.point,
    });
  }
}
