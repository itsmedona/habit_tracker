import 'package:flutter/material.dart';
import 'package:habit_track/view/Themes/DarkMode.dart';
import 'package:habit_track/view/Themes/LightMode.dart';

class ThemeProvider extends ChangeNotifier {
  //intial mode
  ThemeData _themeData = lightMode;

  //get current theme
  ThemeData get themeData => _themeData;

  //is current is dark
  bool get isDarkMode => _themeData == darkMode;

  //set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //toggle theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
