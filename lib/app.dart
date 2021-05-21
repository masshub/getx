import 'package:flutter/material.dart';
import 'package:rent/net/HttpManager.dart';
import 'package:rent/net/contents_type.dart';
import 'package:rent/net/oauth_type.dart';
import 'package:rent/page/center/center.dart';
import 'package:rent/page/home/home.dart';
import 'package:rent/page/mine/mine.dart';
import 'package:rent/plugin/getx/get.dart';

///
/// @author: maker
/// @date: 2021/5/20 10:16
/// description:
///
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final List<BottomNavigationBarItem> bottomNavItem = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home), label: "首页", backgroundColor: Colors.blue),
    BottomNavigationBarItem(
        icon: Icon(Icons.center_focus_strong),
        label: "中心",
        backgroundColor: Colors.red),
    BottomNavigationBarItem(
        icon: Icon(Icons.person), label: "我的", backgroundColor: Colors.cyan),
  ];

  late List<Widget> pages = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pages = [Home(), Centers(), Mine()];

  }




  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _doExitApp(context),
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItem,
            currentIndex: _currentIndex,
            onTap: (value) {
              if (_currentIndex != value) {
                setState(() {
                  _currentIndex = value;
                });
              }
            },
          ),
          body: pages[_currentIndex],
        ));
  }

  _doExitApp(BuildContext context) {}
}
