import 'package:flutter/material.dart';

class ThemeColors {
  static const white = Color(0xFFffffff);
  static const black = Color(0xFF000000);
  static const grey = Color(0xFF969696);
  static const primaryColor = Color(0xFF0B2B5E);
  static const errorColor = Color(0xFFD2341D);
  static const buttonColor = Color(0xFF0B2B5E);
  static const disabledColor = Color(0x4D0B2B5E);
}

class LightThemeColors extends ThemeColors {
  static const white = Color(0xFFffffff);
  static const fieldText = Color(0xFF9DB7CB);
  static const fieldColor = Color(0xFFEDF2F6);
  static const appBarTextColor = Color(0xFF2B333E);
  static const unselectedItemColor = Color(0xFF9DAABF);
  static const selectedItemColor = Color(0xFF0B2B5E);
  static const snackBarColor = Color(0xFF4D4D4D);

}

class DarkThemeColors extends ThemeColors {
  static const backgroundColor = Color(0xFF000000);
  static const scaffoldBackgroundColor = Color(0xFF090806);
  static const textColor = Color(0xFFFFFFFF);
  static final dividerColor = const Color(0xFFFFFFFF).withOpacity(0.05);
}
