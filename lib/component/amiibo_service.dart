import 'package:flutter/foundation.dart';
import 'amiibo_model.dart';
import 'package:http/http.dart' as http;

class AmiiboService {
  static Future<AmiiboModel> getAPI() async {
    String url = "https://www.amiiboapi.com/api/amiibo/";
    http.Response res = await http.get(Uri.parse(url));
    return compute(amiiboModelFromJson, res.body);
  }
}
