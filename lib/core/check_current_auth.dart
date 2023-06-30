import 'package:e_commerce/core/router.dart';
import 'package:e_commerce/src/features/dashboard/screens/dashboard_screen/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'user_data_provider.dart';

Future checkCurrentAuth(ref) async {
  if (FirebaseAuth.instance.currentUser != null) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    var uid = user!.uid;
    await UserDataProvider.querySingleSnapShot(uid: uid, ref: ref);

    await Future.delayed(const Duration(milliseconds: 1000));
    pageRouterPushReplace(ref, const DashboardScreen());

    print('User is signed in!');
  } else {
    pageRouterPushReplace(ref, const WelcomeScreen());
  }
}
