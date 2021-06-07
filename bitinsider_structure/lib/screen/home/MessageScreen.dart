import 'package:bitinsider_structure/widgets/GlabalDrawer.dart';
import 'package:bitinsider_structure/widgets/GlobalBottomNav.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('메시지함'),
        ),
        body: Center(child: Text('메시지함')),
        bottomNavigationBar: GlobalBottomNav(4),
        drawer: GlobalDrawer(),
      ),
    );
  }
}
