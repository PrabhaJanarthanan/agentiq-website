import 'package:agentiqthingswebsite/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ATElevatedButtonTheme {
  ATElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: ATColors.primaryColor,
    disabledBackgroundColor: Colors.blueGrey,
    disabledForegroundColor: Colors.blueGrey,
    side: const BorderSide(color: ATColors.primaryColor,),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));

  //DarkTheme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: Colors.amber,
    disabledBackgroundColor: Colors.blueGrey,
    disabledForegroundColor: Colors.blueGrey,
    side: const BorderSide(color: ATColors.primaryColor),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));
}
