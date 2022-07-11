import 'package:flutter/material.dart';

class Settings extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void setTheme(ThemeMode? theme) {
    if (theme != null) {
      themeMode = theme;
      notifyListeners();
    }
  }
}
