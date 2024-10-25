import 'package:amiibo_api/component/amiibo_model.dart';
import 'package:flutter/material.dart';
import 'amiibo_service.dart';

class AmiiboLogic extends ChangeNotifier {
  AmiiboModel _productList = AmiiboModel(amiibo: []);
  AmiiboModel get productList => _productList;

  bool _loading = false;
  bool get loading => _loading;



  void setLoading() {
    _loading = true;
    notifyListeners();
  }

  Future read() async {
    setLoading();
      _productList = await AmiiboService.getAPI();
      _loading = false;
    notifyListeners();
  }
}
