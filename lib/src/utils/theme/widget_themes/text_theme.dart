import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce/src/constants/colors.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodySmall: GoogleFonts.poppins(color: primaryColor),
    bodyMedium: GoogleFonts.poppins(color: primaryColor),
    bodyLarge: GoogleFonts.poppins(color: primaryColor),
    //---------------------
    labelSmall: GoogleFonts.poppins(color: primaryColor),
    labelMedium: GoogleFonts.poppins(color: primaryColor),
    labelLarge: GoogleFonts.poppins(color: primaryColor),
    //---------------------
    titleSmall: GoogleFonts.poppins(color: primaryColor),
    titleMedium: GoogleFonts.poppins(color: primaryColor),
    titleLarge: GoogleFonts.poppins(color: primaryColor),
    //---------------------
    headlineSmall: GoogleFonts.poppins(color: primaryColor),
    headlineMedium: GoogleFonts.poppins(color: primaryColor),
    headlineLarge: GoogleFonts.poppins(color: primaryColor),
    //---------------------
    displaySmall: GoogleFonts.poppins(color: primaryColor),
    displayMedium: GoogleFonts.poppins(color: primaryColor),
    displayLarge: GoogleFonts.poppins(color: primaryColor),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodySmall: GoogleFonts.poppins(color: accentColor),
    bodyMedium: GoogleFonts.poppins(color: accentColor),
    bodyLarge: GoogleFonts.poppins(color: accentColor),
    //---------------------
    labelSmall: GoogleFonts.poppins(color: accentColor),
    labelMedium: GoogleFonts.poppins(color: accentColor),
    labelLarge: GoogleFonts.poppins(color: accentColor),
    //---------------------
    titleSmall: GoogleFonts.poppins(color: accentColor),
    titleMedium: GoogleFonts.poppins(color: accentColor),
    titleLarge: GoogleFonts.poppins(color: accentColor),
    //---------------------
    headlineSmall: GoogleFonts.poppins(color: accentColor),
    headlineMedium: GoogleFonts.poppins(color: accentColor),
    headlineLarge: GoogleFonts.poppins(color: accentColor),
    //---------------------
    displaySmall: GoogleFonts.poppins(color: accentColor),
    displayMedium: GoogleFonts.poppins(color: accentColor),
    displayLarge: GoogleFonts.poppins(color: accentColor),
  );
}
