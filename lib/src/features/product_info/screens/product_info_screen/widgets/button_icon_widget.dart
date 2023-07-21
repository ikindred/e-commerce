import 'package:e_commerce/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonIconWidget extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  const ButtonIconWidget(
      {super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Center(
            child: FaIcon(
          icon,
          color: secondaryColor,
        )),
      ),
    );
  }
}
