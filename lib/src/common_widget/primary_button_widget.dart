import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce/src/constants/colors.dart';

// ignore: must_be_immutable
class PrimaryButtonWidget extends StatelessWidget {
  String? stringData = "Button Text";
  bool? boldValue = false;
  double? fontSize = 10;
  double? width = 10;
  double? height = 10;
  double? iconSize = 10;
  Color? color = accentColor;
  Color? buttonColor = accentColor;
  bool? centerAlignment;
  String iconPath = "";
  Function onPressed;

  PrimaryButtonWidget(
      {Key? key,
      this.stringData,
      this.fontSize,
      this.boldValue,
      this.color,
      this.width,
      this.height,
      this.iconSize,
      required this.iconPath,
      this.centerAlignment,
      this.buttonColor,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        height: height,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                lightPurple,
                cyan,
              ],
              stops: [
                0.1,
                0.5
              ]),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(right: iconPath.isEmpty ? 0 : 8),
              child: iconPath.isEmpty
                  ? null
                  : SizedBox(
                      width: iconSize,
                      height: iconSize,
                      child: SvgPicture.asset(
                        color: color,
                        iconPath,
                      ),
                    ),
            ),
            Text(
              stringData!,
              style: TextStyle(
                  fontSize: fontSize,
                  color: color,
                  fontFamily: 'Poppins', // Set the font family to 'Poppins'
                  fontWeight: boldValue! ? FontWeight.w600 : FontWeight.normal),
              textAlign: centerAlignment! ? TextAlign.center : TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
