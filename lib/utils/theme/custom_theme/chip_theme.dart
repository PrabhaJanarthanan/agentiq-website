import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ATChipTheme {
  ATChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: ATColors.grey.withAlpha(20),
    labelStyle: const TextStyle(color: ATColors.black),
    selectedColor:ATColors.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: ATColors.white,
  );

  //Darktheme
  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: ATColors.darkerGrey,
    labelStyle: const TextStyle(color:ATColors.white),
    selectedColor: ATColors.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: ATColors.white,
  );
}
