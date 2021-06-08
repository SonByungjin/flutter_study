import 'package:bitinsider_structure/screens/home/home_screen.dart';
import 'package:bitinsider_structure/screens/message/message_screen.dart';
import 'package:bitinsider_structure/screens/notice/notice_screen.dart';
import 'package:bitinsider_structure/screens/popular/popular_screen.dart';
import 'package:bitinsider_structure/screens/price/price_screen.dart';
import 'package:flutter/material.dart';

class GlobalBottomNav extends StatelessWidget {
  List homeWidgets = [
    PriceScreen(),
    NoticeScreen(),
    LandingScreen(),
    PopularScreen(),
    MessageScreen(),
  ];

  List<IconData> homeIcons = [
    Icons.bar_chart,
    Icons.message,
    Icons.home_filled,
    Icons.star,
    Icons.local_post_office
  ];

  int selectedIdx;

  GlobalBottomNav(this.selectedIdx);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (idx) {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => homeWidgets[idx],
            transitionDuration: Duration(seconds: 0),
          ),
        );
      },
      currentIndex: selectedIdx > 0 ? selectedIdx : 0,
      items: homeIcons
          .map((icon) => BottomNavigationBarItem(
              icon: Icon(
                icon,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                icon,
                color: selectedIdx >= 0 ? Colors.red : Colors.grey,
              ),
              label: ''))
          .toList(),
    );
  }
}
