import 'package:bitinsider_structure/widgets/global_drawer.dart';
import 'package:bitinsider_structure/widgets/global_bottomnavigator.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('실시간 시세'),
        ),
        body: Center(child: Text('실시간 시세')),
        bottomNavigationBar: GlobalBottomNav(0),
        drawer: GlobalDrawer(),
      ),
    );
  }
}
