import 'package:bitinsider_structure/bloc/auth/auth_bloc.dart';
import 'package:bitinsider_structure/bloc/auth/auth_event.dart';
import 'package:bitinsider_structure/bloc/auth/auth_state.dart';
import 'package:bitinsider_structure/screens/home/landing/Landing_screen.dart';
import 'package:bitinsider_structure/screens/home/message/message_screen.dart';
import 'package:bitinsider_structure/screens/home/notice/notice_screen.dart';
import 'package:bitinsider_structure/screens/home/popular/popular_screen.dart';
import 'package:bitinsider_structure/screens/home/price/price_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyScaffold extends StatefulWidget {
  final Widget body;
  final String title;
  final int bottomIdx;

  MyScaffold({this.body, this.title, this.bottomIdx});

  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
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

  String userID = '';

  @override
  // void initState() {
  //   super.initState();
  //   BlocProvider.of<AuthBloc>(context).add(ReceiveAuth());
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: this.widget.body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.bottomIdx >= 0 ? widget.bottomIdx : 0,
        type: BottomNavigationBarType.fixed,
        onTap: (tap) {
          // final routeName = routeNames[tap];
          // Navigator.pushNamed(context, '/$routeName');
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, ani1, ani2) => routeWidgets[tap],
              transitionDuration: Duration(seconds: 0),
              settings: RouteSettings(arguments: ''),
            ),
          );
        },
        items: homeIcons
            .map(
              (el) =>
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    el,
                    color: widget.bottomIdx >= 0 ? Colors.red : Colors.grey,
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
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (_, state) {
            if(state is Loaded) {
              userID = state.userInfo['ID'].length > 0 ? state.userInfo['ID'] : '';
            }
            return Column(
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
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userID.length > 0 ? '$userID님 안녕하세요' : '로그인 해주세요',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        child: Text(
                                          userID.length > 0 ? '로그아웃' : '로그인',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onTap: () {
                                          if(userID.length > 0) {
                                            context.read<AuthBloc>().add(removeAuth());
                                          }
                                          Navigator.pushNamed(
                                              context, '/login');
                                        },
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        userID.length > 0 ? '' :'회원가입',
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
                        .map((el) =>
                        InkWell(
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
            );
          },
        ),
      ),
    );
  }
}
