import 'package:bitinsider_structure/screens/home/landing/Landing_screen.dart';
import 'package:bitinsider_structure/screens/home/message/message_screen.dart';
import 'package:bitinsider_structure/screens/home/notice/notice_screen.dart';
import 'package:bitinsider_structure/screens/home/popular/popular_screen.dart';
import 'package:bitinsider_structure/screens/home/price/price_screen.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  List<IconData> homeIcons = [
    Icons.bar_chart,
    Icons.message,
    Icons.home_filled,
    Icons.star,
    Icons.local_post_office
  ];
  List<Widget> routeWidgets = [
    PriceScreen(),
    NoticeScreen(),
    LandingScreen(),
    PopularScreen(),
    MessageScreen(),
  ];
  final Widget body;
  final String title;
  final int bottomIdx;

  MyScaffold({this.body, this.title, this.bottomIdx});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: this.body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIdx >= 0 ? bottomIdx : 0,
        type: BottomNavigationBarType.fixed,
        onTap: (tap) {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, ani1, ani2) => routeWidgets[tap],
              transitionDuration: Duration(seconds: 0),
            ),
          );
        },
        items: homeIcons
            .map(
              (el) => BottomNavigationBarItem(
                  activeIcon: Icon(
                    el,
                    color: bottomIdx >= 0 ? Colors.red : Colors.grey,
                  ),
                  icon: Icon(
                    el,
                    color: Colors.grey,
                  ),
                  label: ''),
            )
            .toList(),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.redAccent,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/mypage');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              width: 60,
                              height: 60,
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '로그인 해주세요',
                                style: TextStyle(color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '로그인',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '회원가입',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.wb_sunny_outlined),
                  InkWell(
                    child: Icon(Icons.settings),
                    onTap: () {
                      Navigator.pushNamed(context, '/setting');
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: homeIcons
                    .map((el) => InkWell(
                          onTap: () {
                            final routeIdx = homeIcons.indexOf(el);
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, ani1, ani2) =>
                                    routeWidgets[routeIdx],
                                transitionDuration: Duration(seconds: 0),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Row(
                              children: [Icon(el), Text('')],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
