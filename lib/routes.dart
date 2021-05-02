import 'package:flutter/material.dart';
import 'package:router_project/screens/ZeroPage.dart';
import 'package:router_project/screens/FirstPage.dart';

final routes = {
  '/': (BuildContext context) => ZeroPage(),
  '/login': (BuildContext context) => FirstPage(),
};
