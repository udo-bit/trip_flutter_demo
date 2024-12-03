import "dart:convert";

import "package:flutter_hi_cache/flutter_hi_cache.dart";
import "package:http/http.dart" as http;
import "package:trip_flutter_demo/util/header_util.dart";
import "package:trip_flutter_demo/util/navigator_util.dart";

import "../util/string_util.dart";

class LoginDao {
  static const String boardingPass = "boarding_pass";
  static login({required String username, required String password}) async {
    Map<String, String> params = {};
    params['userName'] = username;
    params['password'] = password;
    var uri = Uri.http('api.geekailab.com', '/uapi/user/login', params);
    var response = await http.post(uri, headers: hiHeader());
    Utf8Decoder utf8decoder = const Utf8Decoder();
    String bodyString = utf8decoder.convert(response.bodyBytes);
    if (response.statusCode == 200) {
      var result = json.decode(bodyString);
      if (result['code'] == 0 && isNotEmpty(result['data'])) {
        _saveBoardingPass(result['data']);
      } else {
        throw Exception(bodyString);
      }
    } else {
      throw Exception(bodyString);
    }
  }

  static getBoardingPass() {
    return HiCache.getInstance().get(boardingPass);
  }

  static void _saveBoardingPass(String value) {
    HiCache.getInstance().setString(boardingPass, value);
  }

  static logout() {
    HiCache.getInstance().remove(boardingPass);
    NavigatorUtil.goToLogin();
  }
}
