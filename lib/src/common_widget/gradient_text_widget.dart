// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:e_commerce/src/constants/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class GradientTextWidget extends StatelessWidget {
  final String stringData;
  final bool boldValue;
  final double heightValue;
  final double fontSize;
  final bool centerAlignment;

  const GradientTextWidget(
      {Key? key,
      required this.stringData,
      required this.fontSize,
      required this.boldValue,
      required this.centerAlignment,
      required this.heightValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientText(
      stringData,
      style: TextStyle(
          height: heightValue,
          fontSize: fontSize,
          fontFamily: 'Poppins', // Set the font family to 'Poppins'
          fontWeight: boldValue ? FontWeight.bold : FontWeight.normal),
      textAlign: centerAlignment ? TextAlign.center : TextAlign.left,
      colors: const [
        cyan,
        lightPurple
        //add mroe colors here.
      ],
    );
  }
}
