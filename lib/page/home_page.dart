import 'package:flutter/material.dart';
import 'package:trip_flutter_demo/dao/home_dao.dart';
import 'package:trip_flutter_demo/dao/login_dao.dart';
import 'package:trip_flutter_demo/util/navigator_util.dart';
import 'package:trip_flutter_demo/widget/banner_widget.dart';

import '../model/home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  double appBarAlpha = 0;
  double appBarScrollOffset = 100;

  List<CommonModel> bannerListModel = [];
  List<CommonModel> localNavListModel = [];
  List<CommonModel> subNavListModel = [];
  GridNav? gridNavModel;
  SalesBox? salesBoxModel;

  get _buildLogoutButton =>
      TextButton(onPressed: () => {LoginDao.logout()}, child: const Text("登出"));

  get _listView => ListView(
        children: [
          BannerWidget(bannerListModel),
          _buildLogoutButton,
          SizedBox(
            height: 800,
            child: Text(gridNavModel?.hotel?.item3?.title ?? ""),
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
    if (notification is ScrollUpdateNotification && notification.depth == 0) {
      _onScroll(notification.metrics.pixels);
    }
    return false;
  }

  void _onScroll(double pixels) {
    var alpha = pixels / appBarScrollOffset;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  void _handleRefresh() async {
    HomeModel result = await HomeDao.fetch();
    try {
      setState(() {
        bannerListModel = result.bannerList ?? [];
        localNavListModel = result.localNavList ?? [];
        subNavListModel = result.subNavList ?? [];
        gridNavModel = result.gridNav;
        salesBoxModel = result.salesBox;
      });
    } catch (e) {
      throw Exception('服务器异常');
    }
  }
}
