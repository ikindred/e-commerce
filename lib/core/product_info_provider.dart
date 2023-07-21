// ignore_for_file: void_checks, avoid_print, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';

final idSP = StateProvider((_) => '');
final name = StateProvider((_) => '');
final description = StateProvider((_) => '');
final price = StateProvider((_) => '');
final rating = StateProvider((_) => '');

final image_cover = StateProvider((_) => Map());
final colors = StateProvider((_) => Map());

class ProductInfoProvider {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  static Future<void> querySingleSnapShot({required String pid, required ref}) {
    // Call the user's CollectionReference to add a new user
    return FirebaseFirestore.instance
        .collection('products')
        .doc(pid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      print(documentSnapshot.get('id'));
      ref.read(idSP.notifier).state = documentSnapshot.get('id');
      ref.read(name.notifier).state = documentSnapshot.get('name');
      ref.read(description.notifier).state =
          documentSnapshot.get('description');
      ref.read(price.notifier).state = documentSnapshot.get('price');
      ref.read(rating.notifier).state = documentSnapshot.get('rating');

      ref.read(image_cover.notifier).state =
          documentSnapshot.get('image_cover');
      ref.read(colors.notifier).state = documentSnapshot.get('colors');
    });
  }
}
