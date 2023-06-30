import 'package:flutter/material.dart';
import 'package:e_commerce/src/constants/colors.dart';
import 'package:e_commerce/src/utils/theme/widget_themes/text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColorLight: primaryColor,
      textTheme: AppTextTheme.lightTextTheme);
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: primaryColor,
      textTheme: AppTextTheme.darkTextTheme);

// static ThemeData lightTheme = ThemeData(
//   brightness: Brightness.light,
//   primarySwatch: const MaterialColor(0xFF4A495E, <int, Color>{
//     50: Color(0xD4A495E),
//     100: Color(0x1A4A495E),
//     200: Color(0x334A495E),
//     300: Color(0x4D4A495E),
//     400: Color(0x664A495E),
//     500: Color(0x804A495E),
//     600: Color(0x994A495E),
//     700: Color(0xB34A495E),
//     800: Color(0xCC4A495E),
//     900: Color(0xE64A495E)
//   }),
// );
//
// static ThemeData darkTheme = ThemeData();
}
