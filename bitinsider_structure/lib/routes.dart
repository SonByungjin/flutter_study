import 'package:flutter/material.dart';
import 'package:bitinsider_structure/screens/home/landing/Landing_screen.dart';
import 'package:bitinsider_structure/screens/sub/mypage/mypage_screen.dart';
import 'package:bitinsider_structure/screens/sub/setting/setting_screen.dart';

final routes = {
  '/': (BuildContext context) => LandingScreen(),
  // '/price': (BuildContext context) => PriceScreen(),
  // '/message': (BuildContext context) => MessageScreen(),
  // '/popular': (BuildContext context) => PopularScreen(),
  // '/notice': (BuildContext context) => NoticeScreen(),
  '/setting': (BuildContext context) => SettingScreen(),
  '/mypage': (BuildContext context) => MypageScreen(),
};
