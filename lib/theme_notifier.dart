import 'package:flutter/material.dart';



class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; 
  ThemeMode get themeMode => _themeMode;

  bool get isDark =>
      _themeMode == ThemeMode.dark ||
      (_themeMode == ThemeMode.system); 

  ThemeNotifier() {
   
  }

  void toggleTheme() {
    _themeMode = (_themeMode == ThemeMode.dark)
        ? ThemeMode.light
        : ThemeMode.dark;
    notifyListeners();
  }
}
