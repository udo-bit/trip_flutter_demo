import 'package:flutter/material.dart';
import 'package:trip_flutter_demo/navigator/tab_navigator_page.dart';
import 'package:trip_flutter_demo/page/login_page.dart';

class NavigatorUtil {
  static BuildContext? _context;
  static updateContext(BuildContext context) {
    _context = context;
  }

  // 跳转某个页面
  static push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  // 跳转首页
  static goToHome(BuildContext context) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const TabNavigatorPage()));
  }

  // 跳转登陆页
  static goToLogin() {
    if (_context == null) {
      throw Exception("context is null, please update context first");
    }
    Navigator.pushReplacement(
        _context!, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
