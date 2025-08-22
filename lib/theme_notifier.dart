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
    // _saveToPrefs(); // OPTIONAL
  }

  // ===== OPTIONAL: persist the selection =====
  // static const _key = 'theme_mode';
  // Future<void> _saveToPrefs() async {
  //   final sp = await SharedPreferences.getInstance();
  //   await sp.setString(_key, _themeMode.name); // "light" / "dark" / "system"
  // }
  //
  // Future<void> _loadFromPrefs() async {
  //   final sp = await SharedPreferences.getInstance();
  //   final saved = sp.getString(_key);
  //   if (saved != null) {
  //     _themeMode = ThemeMode.values.firstWhere((m) => m.name == saved,
  //         orElse: () => ThemeMode.system);
  //     notifyListeners();
  //   }
  // }
}
