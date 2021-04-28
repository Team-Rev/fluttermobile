import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rev/color_rev.dart';
import 'package:rev/provider/provider_main.dart';

class MainPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this, builder: (context) => MainWidget());
  }
}

class MainWidget extends StatelessWidget {
  final String pageName="MainPage";
  MainProvider _mainProvider;

  @override
  Widget build(BuildContext context) {
    _mainProvider = Provider.of<MainProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorRev.g3,
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
  Widget _navigationBody() {
    switch(_mainProvider.currentPage) {
      case 0:
        return Center(child: Text('프로필'),);
      case 1:
        return Center(child: Text('메인'),);
      case 2:
        return Center(child: Text('공부하기'),);
    }
    return Container();
  }
  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.account_circle),activeIcon:Icon(Icons.account_circle_outlined),label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.assignment),activeIcon:Icon(Icons.assignment_outlined),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.wb_incandescent),activeIcon:Icon(Icons.wb_incandescent_outlined),label: 'Study'),
      ],
      currentIndex: _mainProvider.currentPage,
      selectedItemColor: ColorRev.g3,
      onTap: (index) {
        _mainProvider.updateStatePage(index);
      },
    );
  }
}