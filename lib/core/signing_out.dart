import 'package:e_commerce/core/router.dart';
import 'package:e_commerce/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future signingOut(ref) async {
  await FirebaseAuth.instance.signOut();

  pageRouterPushReplace(ref, const WelcomeScreen());
}
