import 'package:flutter/material.dart';

class ThemeLogic extends ChangeNotifier {
  // bool _dark = false;
  // bool get dark => _dark;

  int themeIndex = 0;

  void toggleTheme() {
    themeIndex == 1 ? themeIndex = 2 : themeIndex = 1;
    notifyListeners();
  }

  void changeToSystem() {
    themeIndex = 0;
    notifyListeners();
  }

  void changeToDark() {
    themeIndex = 1;
    notifyListeners();
  }

  void changeToLight() {
    themeIndex = 2;
    notifyListeners();
  }

  // void changeToDark() {
  //   _dark = true;
  //   notifyListeners();
  // }

  // void changeToLight() {
  //   _dark = false;
  //   notifyListeners();
  // }
}
