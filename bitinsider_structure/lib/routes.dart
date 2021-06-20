import 'package:flutter/material.dart';
import 'package:bitinsider_structure/screens/sub/bitinsider_notice/bitinsider_notice.dart';
import 'package:bitinsider_structure/screens/sub/message/message_screen.dart';
import 'package:bitinsider_structure/screens/sub/news/news_screen.dart';
import 'package:bitinsider_structure/screens/home/exchange_notice/exchange_notice_screen.dart';
import 'package:bitinsider_structure/screens/home/popular/popular_screen.dart';
import 'package:bitinsider_structure/screens/home/price/price_screen.dart';
import 'package:bitinsider_structure/screens/auth/signin/signIn_screen.dart';
import 'package:bitinsider_structure/screens/home/landing/Landing_screen.dart';
import 'package:bitinsider_structure/screens/sub/mypage/mypage_screen.dart';
import 'package:bitinsider_structure/screens/sub/setting/setting_screen.dart';

final routes = {
  '/': (BuildContext context) => LandingScreen(),
  '/price': (BuildContext context) => PriceScreen(),
  '/exchangeNotice': (BuildContext context) => ExchangeNoticeScreen(),
  '/popular': (BuildContext context) => PopularScreen(),
  '/news': (BuildContext context) => NewsScreen(),
  '/message': (BuildContext context) => MessageScreen(),
  '/setting': (BuildContext context) => SettingScreen(),
  '/myPage': (BuildContext context) => MypageScreen(),
  '/login': (BuildContext context) => SignInScreen(),
  '/bitinsiderNotice': (BuildContext context) => BitinsiderNotice(),
};
