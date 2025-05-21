
import 'package:flutter/material.dart';

import 'custom_theme/appbar_theme.dart';
import 'custom_theme/bottom_sheet_theme.dart';
import 'custom_theme/checkbox_theme.dart';
import 'custom_theme/chip_theme.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/outline_button_theme.dart';
import 'custom_theme/text_field_theme.dart';
import 'custom_theme/text_theme.dart';

class ATWebsiteTheme {
  ATWebsiteTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.amber,
    scaffoldBackgroundColor: Colors.white,
    textTheme: ATTextTheme.lightTextTheme,
    elevatedButtonTheme: ATElevatedButtonTheme.lightElevatedButtonTheme,
    chipTheme: ATChipTheme.lightChipTheme,
    appBarTheme: ATAppBarTheme.lightAppBarTheme,
    checkboxTheme: ATCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: ATBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: ATOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: ATTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    scaffoldBackgroundColor: Colors.black,
    textTheme: ATTextTheme.darkTextTheme,
    elevatedButtonTheme: ATElevatedButtonTheme.darkElevatedButtonTheme,
    chipTheme: ATChipTheme.darkChipTheme,
    appBarTheme: ATAppBarTheme.darkAppBarTheme,
    checkboxTheme: ATCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: ATBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: ATOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: ATTextFormFieldTheme.darkInputDecorationTheme,
  );
}
