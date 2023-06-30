import 'package:e_commerce/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonArrowWidget extends StatelessWidget {
  final Function onPressed;

  const ButtonArrowWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        width: 85,
        height: 85,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                lightPurple,
                cyan,
              ],
              stops: [
                0.2,
                1
              ]),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Center(
            child: FaIcon(
          FontAwesomeIcons.arrowRight,
          color: primaryColor,
        )),
      ),
    );
  }
}
