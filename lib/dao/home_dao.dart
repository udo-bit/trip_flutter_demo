import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trip_flutter_demo/model/home_model.dart';
import 'package:trip_flutter_demo/util/header_util.dart';

class HomeDao {
  static Future<HomeModel> fetch() async {
    Uri uri = Uri.parse('http://api.geekailab.com/uapi/ft/home');
    var response = await http.get(uri, headers: hiHeader());
    // 转码
    Utf8Decoder utf8decoder = const Utf8Decoder();
    var bodyString = utf8decoder.convert(response.bodyBytes);
    if (response.statusCode == 200) {
      var map = json.decode(bodyString);
      return HomeModel.fromJson(map['data']);
    } else {
      if (response.statusCode == 401) {
        throw Exception('请先登陆');
      } else {
        throw Exception('服务器异常');
      }
    }
  }
}
