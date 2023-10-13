import 'package:flutter/material.dart';
import 'package:islami_app/screens/bottomSheets/language_bottom_sheet.dart';
import 'package:islami_app/screens/bottomSheets/themeing_bottom_sheet.dart';

class MyProvider extends ChangeNotifier {
  String isoCode = "en";
  ThemeMode appMode = ThemeMode.light;
  int index = 0;

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

  showLanguageBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          )),
      builder: (context) => LanguageBottomSheet(),
    );
  }

  showThemeingBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          )),
      builder: (context) => ThemeingBottomSheet(),
    );
  }

  bottomNavCurrent(value) {
    index = value;
    notifyListeners();
  }
}
