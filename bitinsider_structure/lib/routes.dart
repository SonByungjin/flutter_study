import 'package:flutter/material.dart';
import 'package:bitinsider_structure/screens/home/exchange_notice/exchange_notice_screen.dart';
import 'package:bitinsider_structure/screens/home/popular/popular_screen.dart';
import 'package:bitinsider_structure/screens/home/price/price_screen.dart';
import 'package:bitinsider_structure/screens/etc/login/login_screen.dart';
import 'package:bitinsider_structure/screens/home/landing/Landing_screen.dart';
import 'package:bitinsider_structure/screens/sub/mypage/mypage_screen.dart';
import 'package:bitinsider_structure/screens/sub/setting/setting_screen.dart';

final routes = {
  '/': (BuildContext context) => LandingScreen(),
  '/price': (BuildContext context) => PriceScreen(),
  '/exchangeNotice': (BuildContext context) => ExchangeNoticeScreen(),
  '/popular': (BuildContext context) => PopularScreen(),
  '/news': (BuildContext context) => LandingScreen(),
  '/message': (BuildContext context) => LandingScreen(),
  '/setting': (BuildContext context) => SettingScreen(),
  '/myPage': (BuildContext context) => MypageScreen(),
  '/login': (BuildContext context) => LoginScreen(),
};
