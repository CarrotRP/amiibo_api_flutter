import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ThemeLogic extends ChangeNotifier {
  int _themeIndex = 0;
  int get themeIndex => _themeIndex;

  final _cache = FlutterSecureStorage();
  final _key = "ThemeLogic";

  Future readCache() async {
    String? value = await _cache.read(key: _key);
    _themeIndex = int.parse(value ?? '0');
    notifyListeners();
  }

  void changeToLight() {
    _themeIndex = 0;
    _cache.write(key: _key, value: _themeIndex.toString());
    notifyListeners();
  }

  void changeToDark() {
    _themeIndex = 1;
    _cache.write(key: _key, value: _themeIndex.toString());
    notifyListeners();
  }
}
