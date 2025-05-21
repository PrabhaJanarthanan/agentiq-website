import 'package:flutter/material.dart';

class ATColors {
  ATColors._();

  static const Color primaryColor = Color(0xFFFFC107);
  static const Color secondaryColor = Color.fromARGB(255, 79, 161, 255);
  static const Color accentColor = Color(0xFF607D8B);

 // static const Color grey = Colors.grey;
  //static const Color black = Colors.black;
  //static const Color white = Colors.white;

  //text
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C7570);
  static const Color textWhite = Colors.white;

  //background
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  //containercolors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = ATColors.textWhite.withAlpha(24);

  //button

  static const Color buttonPrimary = Colors.amber;
  static const Color buttonSecondary = Colors.blueGrey;
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  //borders
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  //ErrorValidation
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  //Neutral shades
  static const Color black = Color(0xff232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey= Color(0xFFE0E0E0);
  static const Color softGrey = Color(0XFFF4F4F4);
  static const Color lightGrey = Color(0XFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

}
