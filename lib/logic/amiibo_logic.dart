import 'package:amiibo_api/component/amiibo_model.dart';
import 'package:flutter/material.dart';
import '../component/amiibo_service.dart';

class AmiiboLogic extends ChangeNotifier {
  AmiiboModel _item = AmiiboModel(amiibo: []);
  AmiiboModel get item => _item;

  bool _loading = false;
  bool get loading => _loading;

  String? _error;
  String? get error => _error;

  void setLoading() {
    _loading = true;
    notifyListeners();
  }

  Future read() async {
    setLoading();
    try{
      _item = await AmiiboService.getAPI();
      _error = null;
    } catch(e){
      _error = e.toString();
    } finally{
      _loading = false;
    }
    notifyListeners();
  }
}