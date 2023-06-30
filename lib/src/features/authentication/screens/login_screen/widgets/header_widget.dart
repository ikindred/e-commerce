import 'package:e_commerce/core/router.dart';
import 'package:e_commerce/src/features/authentication/provider/fire_auth_provider.dart';
import 'package:e_commerce/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/src/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../common_widget/text_widget.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => {
            pageRouterPushReplace(context, const WelcomeScreen()),
            emailTEC.text = '',
            passwordTEC.text = '',
          },
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        ),
        SizedBox(
          height: 10,
        ),
        TextWidget(
          stringData: 'Sign in account',
          fontSize: 25,
          boldValue: true,
          color: accentColor,
          centerAlignment: false,
        ),
        TextWidget(
          stringData: 'Hello, Welcome back to Kindred Shop',
          fontSize: 14,
          boldValue: false,
          color: accentColor,
          centerAlignment: false,
        ),
      ],
    );
  }
}
