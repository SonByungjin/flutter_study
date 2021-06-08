import 'package:flutter/material.dart';
import 'package:bitinsider_structure/screens/home/home_screen.dart';
import 'package:bitinsider_structure/screens/mypage/mypage_screen.dart';
import 'package:bitinsider_structure/screens/setting/setting_screen.dart';

final routes = {
  '/': (BuildContext context) => LandingScreen(),
  '/setting': (BuildContext context) => SettingScreen(),
  '/mypage': (BuildContext context) => MypageScreen(),
};
