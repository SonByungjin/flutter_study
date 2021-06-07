import 'package:bitinsider_structure/widgets/GlabalDrawer.dart';
import 'package:bitinsider_structure/widgets/GlobalBottomNav.dart';
import 'package:bitinsider_structure/widgets/GlobalAppBar.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: GlobalAppBar(['공지사항', '인기글', '뉴스'], 'BITINSIDER'),
              body: TabBarView(
                children: [
                  Center(child: Text('공지사항')),
                  Center(child: Text('인기글')),
                  Center(child: Text('뉴스')),
                ],
              ),
              bottomNavigationBar: GlobalBottomNav(2),
              drawer: Drawer(
                child: GlobalDrawer(),
              ),
            );
          },
        ),
      ),
    );
  }
}
