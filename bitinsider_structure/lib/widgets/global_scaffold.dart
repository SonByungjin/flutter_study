import 'package:bitinsider_structure/bloc/auth/auth_bloc.dart';
import 'package:bitinsider_structure/bloc/auth/auth_event.dart';
import 'package:bitinsider_structure/bloc/auth/auth_state.dart';
import 'package:bitinsider_structure/screens/home/exchange_notice/exchange_notice_screen.dart';
import 'package:bitinsider_structure/screens/home/landing/Landing_screen.dart';
import 'package:bitinsider_structure/screens/home/popular/popular_screen.dart';
import 'package:bitinsider_structure/screens/home/price/price_screen.dart';
import 'package:bitinsider_structure/screens/home/public_notice/public_notice_screen.dart';
import 'package:bitinsider_structure/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyScaffold extends StatefulWidget {
  final Widget body;
  final String title;
  final int bottomIdx;
  final TextEditingController appBarSearchCtrl;
  final ScaffoldType scaffoldType;

  MyScaffold({
    @required this.scaffoldType,
    @required this.title,
    @required this.bottomIdx,
    this.appBarSearchCtrl,
    @required this.body,
  });

  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

const orangeColor = Color(0xffff6440);

class _MyScaffoldState extends State<MyScaffold> {
  List<IconData> homeIcons = [
    Icons.bar_chart,
    Icons.message,
    Icons.home_filled,
    Icons.star,
    Icons.flag_sharp
  ];

  List<Widget> routeWidgets = [
    PriceScreen(),
    ExchangeNoticeScreen(),
    LandingScreen(),
    PopularScreen(),
    PublicNoticeScreen(),
  ];

  String userID = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey.shade500),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.grey.shade100,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.sms_outlined),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
              widget.scaffoldType == ScaffoldType.SEARCH ? 60 : 0),
          child: Builder(
            builder: (BuildContext context) {
              switch (widget.scaffoldType) {
                case ScaffoldType.SEARCH:
                  return Container(
                    // height: 30,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: SizedBox(
                      height: 40,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(primaryColor: orangeColor),
                        child: TextField(
                          cursorColor: orangeColor,
                          autofocus: false,
                          controller: this.widget.appBarSearchCtrl,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                            contentPadding: EdgeInsets.only(left: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: orangeColor),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                case ScaffoldType.SELECT:
                  return Container();
                case ScaffoldType.NONE:
                  return Container();
                default:
                  return Container();
              }
            },
          ),
        ),
      ),
      body: this.widget.body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.bottomIdx >= 0 ? widget.bottomIdx : 0,
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
                    color: widget.bottomIdx >= 0 ? orangeColor : Colors.grey,
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
            if (state is Loaded) {
              userID =
                  state.userInfo['ID'].length > 0 ? state.userInfo['ID'] : '';
            }
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30, bottom: 20),
                  height: 150,
                  color: orangeColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          width: 100,
                          height: 100,
                          child: userID.length > 0
                              ? CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/profile.png'),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.white,
                                )),
                      SizedBox(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userID.length > 0 ? '$userID' : '로그인 해주세요',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (userID.length > 0) {
                                      Navigator.pushNamed(context, '/myPage');
                                    } else {
                                      Navigator.pushNamed(context, '/login');
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4),
                                        child: Text(
                                          userID.length > 0 ? '마이페이지' : '로그인',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.white,
                                        size: 12,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (userID.length > 0) {
                                      context
                                          .read<AuthBloc>()
                                          .add(removeAuth());
                                      Navigator.pushNamed(context, '/');
                                    } else {
                                      Navigator.pushNamed(context, '/login');
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4),
                                        child: Text(
                                          userID.length > 0 ? '로그아웃' : '회원가입',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.white,
                                        size: 12,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/bitinsiderNotice');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Center(
                                child: Image.asset('assets/icon_bit_white.png'),
                              ),
                              backgroundColor: orangeColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                '비트인싸 공지',
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/setting');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Center(
                                child: Image.asset(
                                    'assets/icon_setting_white.png'),
                              ),
                              backgroundColor: orangeColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                '환경설정',
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                DrawerList(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  final List<Map> drawerConstant = [
    {'text': '홈', 'navigator': '', 'icon': Icons.home_outlined},
    {
      'text': '실시간 시세',
      'navigator': 'price',
      'icon': Icons.stacked_line_chart_rounded
    },
    {
      'text': '거래소 공지',
      'navigator': 'exchangeNotice',
      'icon': Icons.message_outlined
    },
    {
      'text': '인기글 TOP',
      'navigator': 'popular',
      'icon': Icons.star_border_outlined
    },
    {
      'text': 'NEWS',
      'navigator': 'news',
      'icon': Icons.sms_outlined,
    },
    {'text': '메시지함', 'navigator': 'message', 'icon': Icons.email_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: 6,
        itemBuilder: (BuildContext context, int idx) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                    context, '/${drawerConstant[idx]['navigator']}');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Icon(
                          drawerConstant[idx]['icon'],
                          color: orangeColor,
                        ),
                      ),
                      Text(
                        drawerConstant[idx]['text'],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
