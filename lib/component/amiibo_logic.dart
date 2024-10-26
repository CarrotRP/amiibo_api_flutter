import 'package:amiibo_api/component/amiibo_model.dart';
import 'package:flutter/material.dart';
import 'amiibo_service.dart';

class AmiiboLogic extends ChangeNotifier {
  AmiiboModel _item = AmiiboModel(amiibo: []);
  AmiiboModel get item => _item;

  bool _loading = false;
  bool get loading => _loading;



  void setLoading() {
    _loading = true;
    notifyListeners();
  }

  Future read() async {
    setLoading();
      _item = await AmiiboService.getAPI();
      _loading = false;
    notifyListeners();
  }
}