import 'package:chat_test/core/theme/theme_data.dart';
import 'package:flutter/material.dart';

enum LightThemes { violetTheme }

enum DarkThemes { violetTheme }

Map<LightThemes, ThemeData> lightThemes = {
  LightThemes.violetTheme: lightTheme,
};

Map<DarkThemes, ThemeData> darkThemes = {
  DarkThemes.violetTheme: darkTheme,
};
