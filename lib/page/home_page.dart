import 'package:flutter/material.dart';
import 'package:trip_flutter_demo/dao/login_dao.dart';
import 'package:trip_flutter_demo/util/navigator_util.dart';
import 'package:trip_flutter_demo/widget/banner_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double appBarAlpha = 1;
  List<String> bannerList = [
    'https://img2.baidu.com/it/u=257681495,312745373&fm=253&fmt=auto&app=120&f=JPEG?w=750&h=500',
    'https://img2.baidu.com/it/u=257681495,312745373&fm=253&fmt=auto&app=120&f=JPEG?w=750&h=500',
    'https://pic.rmb.bdstatic.com/bjh/news/06ea4ae7b91c824e3267dca60d938e4d.png',
    'https://img0.baidu.com/it/u=2931243091,718249849&fm=253&fmt=auto&app=120&f=JPEG?w=569&h=427',
  ];
  get _buildLogoutButton =>
      TextButton(onPressed: () => {LoginDao.logout()}, child: const Text("登出"));

  get _listView => ListView(
        children: [
          BannerWidget(bannerList),
          _buildLogoutButton,
          const SizedBox(
            height: 800,
            child: Text("首页内容"),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    NavigatorUtil.updateContext(context);
    return Scaffold(
      body: Stack(
        children: [
          MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: NotificationListener(
                onNotification: _onNotification,
                child: _listView,
              )),
          _appBar(),
        ],
      ),
    );
  }

  Widget _appBar() {
    return Opacity(
      opacity: appBarAlpha,
      child: Container(
        height: 80,
        decoration: const BoxDecoration(color: Colors.white),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("首页"),
          ),
        ),
      ),
    );
  }

  bool _onNotification(Notification notification) {
    return false;
  }
}
