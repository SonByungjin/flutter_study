import 'package:bitssa_demo/screens/auth/singin_screen.dart';
import 'package:bitssa_demo/screens/landing/landing_scaffold.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (BuildContext context) => LandingScaffold(),
  '/signIn': (BuildContext context) => SignInScreen(),
};

