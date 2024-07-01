import 'package:flutter/material.dart';

import 'colors/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const flightPreferences = TextStyle(
    color: Colors.black,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
  static const chatsTitle = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  static const hintTextStyle = TextStyle(
    color: LightThemeColors.fieldText,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const appBarTitle = TextStyle(
    color: LightThemeColors.appBarTextColor,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );
  static const deleteText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: LightThemeColors.white,
  );
}
