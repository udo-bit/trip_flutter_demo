import 'package:flutter/material.dart';
import 'package:trip_flutter_demo/dao/login_dao.dart';
import 'package:trip_flutter_demo/util/navigator_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get _buildLogoutButton => ElevatedButton(
      onPressed: () => {LoginDao.logout()}, child: const Text("登出"));

  @override
  Widget build(BuildContext context) {
    NavigatorUtil.updateContext(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          actions: [_buildLogoutButton],
        ),
        body: const Center(
          child: Text('Home Page'),
        ));
  }
}
