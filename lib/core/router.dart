import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';

pageRouterPush(ref, page) {
  Navigator.push(
    ref,
    PageTransition(type: PageTransitionType.fade, child: page, ctx: ref),
  );
}

pageRouterPushReplace(ref, page) {
  Navigator.pushReplacement(
    ref,
    PageTransition(type: PageTransitionType.fade, child: page, ctx: ref),
  );
}
