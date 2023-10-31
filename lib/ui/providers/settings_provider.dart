import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  String currentLocale = "en";
  ThemeMode currentMode = ThemeMode.light;

  bool isDarkMode() => currentMode == ThemeMode.light;

  setCurrentMode(ThemeMode newThemeMode) {
    currentMode = newThemeMode;
    notifyListeners();
  }

  void setCurrentLocale(newValue) {
    currentLocale = newValue;
    notifyListeners();
  }
}
