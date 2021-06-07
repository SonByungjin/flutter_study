import 'package:flutter/material.dart';
import 'package:bitinsider_structure/screen/home/LandingScreen.dart';
import 'package:bitinsider_structure/screen/mypage/MypageScreen.dart';
import 'package:bitinsider_structure/screen/setting/SettingScreen.dart';

final routes = {
  '/': (BuildContext context) => LandingScreen(),
  '/setting': (BuildContext context) => SettingScreen(),
  '/mypage': (BuildContext context) => MypageScreen(),
};
