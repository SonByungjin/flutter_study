import 'package:flutter/material.dart';
import 'package:graigeo_assignment/screens/LandingScreen.dart';
import 'package:graigeo_assignment/screens/HeartScreen.dart';

final routes = {
  '/' : (BuildContext context) => LandingScreen(),
  '/heart': (BuildContext context) => HeartScreen(),
};
