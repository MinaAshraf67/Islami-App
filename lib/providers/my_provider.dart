import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String isoCode = "en";
  ThemeMode appMode = ThemeMode.light;

  void changeLanguage(String langCode) {
    isoCode = langCode;
    notifyListeners();
  }

  void changeThemeMode(ThemeMode mode) {
    appMode = mode;
    // if (appMode == ThemeMode.light) {
    //   appMode = ThemeMode.dark;
    // } else {
    //   appMode = ThemeMode.light;
    // }
    notifyListeners();
  }

  String getBackgrund() {
    if (appMode == ThemeMode.light) {
      return 'assets/images/background.png';
    } else {
      return 'assets/images/background_dark.png';
    }
  }
}
