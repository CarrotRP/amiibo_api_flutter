import 'package:flutter/material.dart';

class ThemeLogic extends ChangeNotifier {
  int themeIndex = 0;

  void toggleTheme() {
    themeIndex == 0 ? themeIndex = 1 : themeIndex = 0;
    notifyListeners();
  }
  
  void changeToLight() {
    themeIndex = 0;
    notifyListeners();
  }

  void changeToDark() {
    themeIndex = 1;
    notifyListeners();
  }

}
