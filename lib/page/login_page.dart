import 'package:flutter/material.dart';
import 'package:trip_flutter_demo/dao/login_dao.dart';
import 'package:trip_flutter_demo/util/login_button.dart';
import 'package:trip_flutter_demo/util/navigator_util.dart';

import '../util/string_util.dart';
import '../util/view_util.dart';
import '../widget/input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool enable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          ..._buildBackground(),
          _buildLoginForm(),
        ],
      ),
    );
  }

  _buildBackground() {
    return [
      Positioned.fill(
        child: Image.asset(
          "images/login_bg1.png",
          fit: BoxFit.cover,
        ),
      ),
      Positioned.fill(
          child: Container(
        decoration: const BoxDecoration(color: Colors.black38),
      ))
    ];
  }

  _buildLoginForm() {
    return Positioned.fill(
        left: 25,
        right: 25,
        child: ListView(
          children: [
            hiSpace(100),
            const Text(
              "账号密码登陆",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            hiSpace(40),
            // 账号
            InputWidget(
              "请输入账号",
              onChanged: (text) {
                setState(() {
                  username = text;
                  validCheck();
                });
              },
            ),
            hiSpace(20),
            // 密码
            InputWidget(
              "请输入密码",
              obscureText: true,
              onChanged: (text) {
                setState(() {
                  password = text;
                  validCheck();
                });
              },
              keyboardType: TextInputType.number,
            ),
            hiSpace(20),
            // 登陆按钮
            LoginButton(
              "登陆",
              onPressed: () {
                _login(context);
              },
              enable: enable,
            ),
            hiSpace(20),
            Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: () => {},
                    child: const Text('注册账号',
                        style: TextStyle(color: Colors.white))))
          ],
        ));
  }

  void validCheck() {
    if (isNotEmpty(username) && isNotEmpty(password)) {
      setState(() {
        enable = true;
      });
    } else {
      setState(() {
        enable = false;
      });
    }
  }

  void _login(context) async {
    await LoginDao.login(username: username, password: password);
    NavigatorUtil.goToHome(context);
  }
}
