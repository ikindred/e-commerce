import 'package:flutter/material.dart';
import 'package:e_commerce/src/common_widget/primary_button_widget.dart';
import 'package:e_commerce/src/common_widget/text_widget.dart';
import 'package:e_commerce/src/constants/colors.dart';

import 'gradient_text_widget.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String message;
  final String emoji;
  final String buttonText;
  final Function onPressed;

  const AlertDialogWidget({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onPressed,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Dialog(
      insetPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: darkPurple,
      child: SizedBox(
        width: size.width * 0.9,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 30, 40, 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GradientTextWidget(
                stringData: emoji,
                heightValue: 1.3,
                fontSize: 26,
                boldValue: false,
                centerAlignment: true,
              ),
              const SizedBox(height: 10),
              GradientTextWidget(
                stringData: title,
                heightValue: 1.3,
                fontSize: 28,
                boldValue: false,
                centerAlignment: true,
              ),
              const SizedBox(height: 20),
              TextWidget(
                stringData: message,
                fontSize: 15,
                boldValue: false,
                color: accentColor,
                centerAlignment: true,
              ),
              const SizedBox(height: 30),
              PrimaryButtonWidget(
                stringData: buttonText,
                height: 50,
                iconPath: '',
                width: size.width * 0.6,
                iconSize: 35,
                fontSize: 12,
                boldValue: true,
                color: darkPurple,
                buttonColor: lightGray,
                onPressed: () => onPressed(),
                centerAlignment: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
