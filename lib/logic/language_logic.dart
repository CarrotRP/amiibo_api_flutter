import 'package:flutter/material.dart';

import '../component/language_constant.dart';

class LanguageLogic extends ChangeNotifier {
  int _langIndex = 0;
  int get langIndex => _langIndex;

  LanguageConstant _lang = Khmer();
  LanguageConstant get lang => _lang;

  void changeToKhmer() {
    _langIndex = 0;
    _lang = langList[_langIndex];
    notifyListeners();
  }

  void changeToEnglish() {
    _langIndex = 1;
    _lang = langList[_langIndex];
    notifyListeners();
  }
}
