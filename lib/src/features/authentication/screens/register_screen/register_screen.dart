// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce/src/common_widget/primary_button_widget.dart';
import 'package:e_commerce/src/constants/colors.dart';
import 'package:e_commerce/src/features/authentication/provider/fire_auth_provider.dart';
import 'package:e_commerce/src/common_widget/outline_text_form.dart';
import 'package:e_commerce/src/features/authentication/screens/register_screen/widgets/password_text_form.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/src/features/authentication/screens/register_screen/widgets/header_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        // child: ElevatedButton(
        //     onPressed: () => {checkAuthState()}, child: Text("Test AUth")),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWidget(),
                    const SizedBox(height: 40),
                    OutlineTextForm(
                      textController: usernameTEC,
                      hintText: 'Username',
                      text: '',
                      label: '',
                    ),
                    const SizedBox(height: 30),
                    OutlineTextForm(
                      textController: emailTEC,
                      hintText: 'Email',
                      text: '',
                      label: '',
                    ),
                    const SizedBox(height: 30),
                    PasswordTextForm(
                      hintText: 'Password',
                      text: '',
                      label: '',
                    ),
                    const SizedBox(height: 70),
                    PrimaryButtonWidget(
                      stringData: "Register",
                      height: 60,
                      iconPath: '',
                      width: size.width * 1,
                      iconSize: 35,
                      fontSize: 18,
                      boldValue: false,
                      color: darkPurple,
                      buttonColor: lightGray,
                      onPressed: () => {register(context)},
                      centerAlignment: false,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
