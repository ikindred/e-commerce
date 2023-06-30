// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce/core/router.dart';
import 'package:e_commerce/src/common_widget/primary_button_widget.dart';
import 'package:e_commerce/src/common_widget/secondary_button_widget.dart';
import 'package:e_commerce/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:e_commerce/src/features/authentication/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/src/common_widget/gradient_text_widget.dart';
import 'package:e_commerce/src/common_widget/text_widget.dart';
import 'package:e_commerce/src/constants/colors.dart';
import 'package:e_commerce/src/constants/image_string.dart';
import 'package:e_commerce/src/constants/text_string.dart';

import 'widgets/background_painter.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
              top: 10,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: size.width * 0.95,
                  height: size.height * 0.5,
                  child: CustomPaint(
                    painter: BackgroundPainter(),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 20,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: size.width * 0.42,
                  height: size.height * 0.5,
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              lightPurple,
                              lightPurple,
                              cyan,
                              cyan,
                            ],
                            stops: [
                              0.1,
                              0.3,
                              0.8,
                              1
                            ])),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 20,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: size.width * 0.42,
                  height: size.height * 0.5,
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              transparent,
                              transparent,
                              primaryColor,
                              primaryColor,
                            ],
                            stops: [
                              0.1,
                              0.5,
                              0.9,
                              1
                            ])),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 96,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    width: size.width * 0.42,
                    height: size.height * 0.5,
                    child: const Image(
                      image: AssetImage(handCard),
                      height: 100,
                      width: 100,
                    )),
              ),
            ),
            Positioned.fill(
              top: 50,
              child: Align(
                alignment: Alignment.topCenter,
                child: TextWidget(
                  stringData: appName,
                  fontSize: 25,
                  boldValue: true,
                  color: primaryColor,
                  centerAlignment: true,
                ),
              ),
            ),
            const Positioned.fill(
              top: 300,
              child: Align(
                alignment: Alignment.center,
                child: GradientTextWidget(
                  stringData: 'Hassle free\nonline shopping',
                  fontSize: 35,
                  boldValue: true,
                  heightValue: 1.2,
                  centerAlignment: true,
                ),
              ),
            ),
            Positioned.fill(
              top: 450,
              child: Align(
                alignment: Alignment.center,
                child: TextWidget(
                  stringData:
                      'online and fastest alternative\nshopping experience',
                  fontSize: 15,
                  boldValue: false,
                  color: accentColor,
                  centerAlignment: true,
                ),
              ),
            ),
            Positioned.fill(
              bottom: 50,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PrimaryButtonWidget(
                      stringData: "Login",
                      height: 60,
                      iconPath: '',
                      width: size.width * 1,
                      iconSize: 35,
                      fontSize: 18,
                      boldValue: false,
                      color: darkPurple,
                      buttonColor: lightGray,
                      onPressed: () =>
                          {pageRouterPushReplace(context, const LoginScreen())},
                      centerAlignment: false,
                    ),
                    SecondaryButtonWidget(
                      stringData: "Register",
                      height: 60,
                      iconPath: '',
                      width: size.width * 1,
                      iconSize: 35,
                      fontSize: 18,
                      boldValue: false,
                      color: darkPurple,
                      buttonColor: accentColor,
                      onPressed: () => {
                        pageRouterPushReplace(context, const RegisterScreen())
                      },
                      centerAlignment: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
