import 'package:e_commerce/core/check_current_auth.dart';
import 'package:riverpod/riverpod.dart';

final animate = StateProvider((_) => false);

final skipWelcome = StateProvider((_) => false);

Future startAnimation(ref) async {
  await Future.delayed(const Duration(milliseconds: 600));
  ref.read(animate.notifier).state = true;
  await Future.delayed(const Duration(milliseconds: 3000));
  ref.read(animate.notifier).state = false;
  await Future.delayed(const Duration(milliseconds: 1500));

  if (ref.watch(skipWelcome) == false) {
    ref.read(skipWelcome.notifier).state = true;

    checkCurrentAuth(ref);
  }
}
