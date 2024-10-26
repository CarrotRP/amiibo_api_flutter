import 'package:flutter/material.dart';

class ThemeLogic extends ChangeNotifier {
  int _themeIndex = 0;
  int get themeIndex => _themeIndex;
  
  void changeToLight() {
    _themeIndex = 0;
    notifyListeners();
  }

  void changeToDark() {
    _themeIndex = 1;
    notifyListeners();
  }

}
