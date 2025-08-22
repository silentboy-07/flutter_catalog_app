import 'package:flutter/material.dart';
// OPTIONAL persistence:
// import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // start by following system
  ThemeMode get themeMode => _themeMode;

  bool get isDark =>
      _themeMode == ThemeMode.dark ||
      (_themeMode == ThemeMode.system); // UI helper if needed

  ThemeNotifier() {
    // _loadFromPrefs(); // OPTIONAL: uncomment if you implement persistence below
  }

  void toggleTheme() {
    _themeMode = (_themeMode == ThemeMode.dark)
        ? ThemeMode.light
        : ThemeMode.dark;
    notifyListeners();
  }
}
