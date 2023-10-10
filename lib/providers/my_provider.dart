import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String isoCode = "en";

  void changeLanguage(String langCode) {
    isoCode = langCode;
    notifyListeners();
  }
}
