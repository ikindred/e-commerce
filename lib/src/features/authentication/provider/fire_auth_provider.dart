// ignore_for_file: unused_local_variable, unnecessary_set_literal

import 'package:e_commerce/core/provider/public_provider.dart';
import 'package:e_commerce/core/router.dart';
import 'package:e_commerce/core/user_data_provider.dart';
import 'package:e_commerce/src/common_widget/alert_dialog_widget.dart';
import 'package:e_commerce/src/common_widget/loading_dialog.dart';
import 'package:e_commerce/src/features/dashboard/screens/dashboard_screen/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final showPassword = StateProvider((_) => false);
final emailTEC = TextEditingController();
final usernameTEC = TextEditingController();

final passwordTEC = TextEditingController();

final FirebaseAuth auth = FirebaseAuth.instance;
Future login(ref) async {
  try {
    if (emailTEC.text.isNotEmpty && passwordTEC.text.isNotEmpty) {
      showDialog(
        context: ref,
        barrierDismissible: false,
        builder: (context) {
          return const LoadingDialog();
        },
      );

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailTEC.text, password: passwordTEC.text);

      final User? user = auth.currentUser;
      var uid = user!.uid;
      await UserDataProvider.querySingleSnapShot(uid: uid, ref: ref);

      Navigator.of(ref).pop();
      emailTEC.text = '';
      passwordTEC.text = '';
      pageRouterPushReplace(ref, const DashboardScreen());
    } else {
      showDialog(
        context: ref,
        builder: (BuildContext context) {
          return AlertDialogWidget(
              title: "Alert Message",
              message: "Please fill all the blanks",
              buttonText: "Try again",
              onPressed: () {
                Navigator.of(ref).pop();
              },
              emoji: "📢 🔔 🚨");
        },
      );
    }
  } on FirebaseAuthException catch (e) {
    Navigator.of(ref).pop();
    if (e.code == 'user-not-found') {
      showDialog(
        context: ref,
        builder: (BuildContext context) {
          return AlertDialogWidget(
              title: "Not Existing Email",
              message: "Please Enter Valid Email ",
              buttonText: "Try again",
              onPressed: () {
                Navigator.of(ref).pop();
                emailTEC.text = '';
                passwordTEC.text = '';
              },
              emoji: "📢 🔔 🚨");
        },
      );
    } else if (e.code == 'wrong-password') {
      showDialog(
        context: ref,
        builder: (BuildContext context) {
          return AlertDialogWidget(
              title: "Wrong Password",
              message: "Please enter the correct password",
              buttonText: "Try again",
              onPressed: () {
                Navigator.of(ref).pop();
                passwordTEC.text = '';
              },
              emoji: "📢 🔔 🚨");
        },
      );
    }
  }
}

Future register(ref) async {
  try {
    if (emailTEC.text.isNotEmpty &&
        passwordTEC.text.isNotEmpty &&
        usernameTEC.text.isNotEmpty) {
      showDialog(
        context: ref,
        barrierDismissible: false,
        builder: (context) {
          return const LoadingDialog();
        },
      );

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailTEC.text, password: passwordTEC.text);

      User? user = auth.currentUser;
      var uid = user!.uid;

      await UserDataProvider.addUser(uid, emailTEC.text, usernameTEC.text);
      ref.read(userNameFire.notifier).state = usernameTEC.text;

      Navigator.of(ref).pop();
      emailTEC.text = '';
      passwordTEC.text = '';
      pageRouterPushReplace(ref, const DashboardScreen());
    } else {
      showDialog(
        context: ref,
        builder: (BuildContext context) {
          return AlertDialogWidget(
              title: "Alert Message",
              message: "Please fill all the blanks",
              buttonText: "Try again",
              onPressed: () {
                Navigator.of(ref).pop();
              },
              emoji: "📢 🔔 🚨");
        },
      );
    }
  } on FirebaseAuthException catch (e) {
    Navigator.of(ref).pop();
    if (e.code == 'weak-password') {
      showDialog(
        context: ref,
        builder: (BuildContext context) {
          return AlertDialogWidget(
              title: "Weak Password",
              message: "Please Strong Password",
              buttonText: "Try again",
              onPressed: () {
                Navigator.of(ref).pop();

                passwordTEC.text = '';
              },
              emoji: "📢 🔔 🚨");
        },
      );
    } else if (e.code == 'email-already-in-use') {
      showDialog(
        context: ref,
        builder: (BuildContext context) {
          return AlertDialogWidget(
              title: "Existing Email",
              message: "Please enter another email",
              buttonText: "Try again",
              onPressed: () {
                Navigator.of(ref).pop();
                emailTEC.text = '';
                passwordTEC.text = '';
              },
              emoji: "📢 🔔 🚨");
        },
      );
    }
  }
}

bool validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return !regex.hasMatch(value!);
}
