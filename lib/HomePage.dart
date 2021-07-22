import 'package:flutter/material.dart';
import 'package:test_app/Authentication/authService.dart';
import 'package:test_app/Drawerpage/Widget/Navigation_drawer_widget.dart';

import 'BottamNavigationBarWidget/TabBarItem.dart';
import 'Pages/search.dart';
import 'Pages/Home.dart';
import 'Pages/Profile.dart';
import 'Pages/Setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int index = 0;

  final pages = <Widget>[
    Home2(),
    Search(),
    Profile(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        extendBody: true,
        body: pages[index],
        bottomNavigationBar: TabBarMaterialWidget(
          index: index,
          onChangedTab: onChangedTab,
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.logout),
            onPressed: () => AuthService().signOut()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
