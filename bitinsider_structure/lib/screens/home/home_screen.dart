import 'package:bitinsider_structure/widgets/global_drawer.dart';
import 'package:bitinsider_structure/widgets/global_bottomnavigator.dart';
import 'package:bitinsider_structure/widgets/global_appbar.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<IconData> homeIcons = [
    Icons.bar_chart,
    Icons.message,
    Icons.home_filled,
    Icons.star,
    Icons.local_post_office
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        initialIndex: 2,
        child: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text('BITINSIDER'),
              ),
              body: TabBarView(
                children: [
                  Center(child: Text('실시간 시세')),
                  Center(child: Text('메시지')),
                  Center(child: Text('홈')),
                  Center(child: Text('인기글')),
                  Center(child: Text('공지')),
                ],
              ),
              bottomNavigationBar: TabBar(
                indicatorColor: Colors.transparent,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.grey,
                tabs: homeIcons
                    .map(
                      (el) => Tab(
                        icon: Icon(
                          el,
                        ),
                      ),
                    )
                    .toList(),
              ),
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
