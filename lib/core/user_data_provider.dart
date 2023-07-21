// ignore_for_file: void_checks, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/provider/public_provider.dart';

class UserDataProvider {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  static Future<bool> getUser({required String userId}) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        return true;
      } else {
        return false;
      }
    });
  }

  static Future<void> addUser(
    uid,
    email,
    username,
  ) {
    return users
        .doc(uid)
        .set({
          'email': email,
          'username': username,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static Future<void> querySingleSnapShot({required String uid, required ref}) {
    // Call the user's CollectionReference to add a new user

    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      ref.read(userNameFire.notifier).state = documentSnapshot.get('username');
      ref.read(emailFire.notifier).state = documentSnapshot.get('email');
      ref.read(userCartFire.notifier).state = documentSnapshot.get('cart');
    });
  }
}
