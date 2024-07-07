import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  String appLanguage = 'en';
  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }

  ThemeMode appTheme = ThemeMode.light;
  void changeTheme(ThemeMode newMode) {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    notifyListeners();
  }

  isDarkMode() {
    appTheme == ThemeMode.dark;
  }
}
