import 'package:flutter/material.dart';
import 'package:trip_flutter_demo/page/home_page.dart';
import 'package:trip_flutter_demo/page/my_page.dart';
import 'package:trip_flutter_demo/page/search_page.dart';
import 'package:trip_flutter_demo/page/travel_page.dart';

class TabNavigatorPage extends StatefulWidget {
  const TabNavigatorPage({super.key});

  @override
  State<TabNavigatorPage> createState() => _TabNavigatorPageState();
}

class _TabNavigatorPageState extends State<TabNavigatorPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _pageController,
        children: const [HomePage(), SearchPage(), TravelPage(), MyPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.jumpToPage(index);
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            _buildItems("首页", Icons.home, 0),
            _buildItems("搜索", Icons.search, 1),
            _buildItems("旅拍", Icons.camera_alt, 2),
            _buildItems("搜索", Icons.account_circle, 3)
          ]),
    );
  }

  _buildItems(String title, IconData iconDate, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          iconDate,
          color: _defaultColor,
        ),
        activeIcon: Icon(iconDate, color: _activeColor),
        label: title);
  }
}
