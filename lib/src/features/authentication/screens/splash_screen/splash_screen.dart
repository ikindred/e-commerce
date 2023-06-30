// ignore_for_file: use_build_context_synchronously
import 'package:e_commerce/src/common_widget/gradient_text_widget.dart';
import 'package:e_commerce/src/common_widget/text_widget.dart';
import 'package:e_commerce/src/constants/colors.dart';
import 'package:e_commerce/src/constants/text_string.dart';
import 'package:e_commerce/src/features/authentication/provider/splash_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/src/constants/image_string.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    startAnimation(ref);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext contex) {
    Size size = MediaQuery.of(context).size;

    var animateValue = ref.watch(animate);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(welcomeBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              top: -200,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                    width: size.width * 0.3,
                    height: size.height * 0.3,
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 1800),
                        opacity: animateValue ? 1 : 0,
                        child: const Image(
                          image: AssetImage(splashIcon),
                        ))),
              ),
            ),
            Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 1800),
                    opacity: animateValue ? 1 : 0,
                    child: const GradientTextWidget(
                      stringData: appName,
                      fontSize: 35,
                      boldValue: true,
                      heightValue: 1.2,
                      centerAlignment: false,
                    ),
                  )),
            ),
            Positioned.fill(
              top: 70,
              child: Align(
                  alignment: Alignment.center,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 1800),
                    opacity: animateValue ? 1 : 0,
                    child: TextWidget(
                      stringData: appTagline,
                      fontSize: 18,
                      boldValue: false,
                      color: accentColor,
                      centerAlignment: true,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
