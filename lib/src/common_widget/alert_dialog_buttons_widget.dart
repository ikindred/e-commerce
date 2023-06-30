import 'package:e_commerce/src/common_widget/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/src/common_widget/primary_button_widget.dart';
import 'package:e_commerce/src/common_widget/text_widget.dart';
import 'package:e_commerce/src/constants/colors.dart';

import '../../core/signing_out.dart';
import 'gradient_text_widget.dart';

class AlertDialogButtonsWidget extends StatelessWidget {
  final String title;
  final String message;
  final String emoji;
  final String buttonText;

  const AlertDialogButtonsWidget({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PrimaryButtonWidget(
                    stringData: 'Yes',
                    height: 50,
                    iconPath: '',
                    width: size.width * 0.6,
                    iconSize: 35,
                    fontSize: 15,
                    boldValue: true,
                    color: darkPurple,
                    buttonColor: lightGray,
                    onPressed: () =>
                        {Navigator.of(context).pop(), signingOut(context)},
                    centerAlignment: false,
                  ),
                  SecondaryButtonWidget(
                    stringData: 'No',
                    height: 50,
                    iconPath: '',
                    width: size.width * 0.6,
                    iconSize: 35,
                    fontSize: 15,
                    boldValue: true,
                    color: accentColor,
                    buttonColor: red,
                    onPressed: () => {Navigator.of(context).pop()},
                    centerAlignment: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
