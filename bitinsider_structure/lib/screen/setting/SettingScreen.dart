import 'package:bitinsider_structure/widgets/GlabalDrawer.dart';
import 'package:bitinsider_structure/widgets/GlobalBottomNav.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('설정'),
        ),
        body: Center(child: Text('설정')),
        bottomNavigationBar: GlobalBottomNav(-1),
        drawer: GlobalDrawer(),
      ),
    );
  }
}
