import 'package:bitssa_demo/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: routes,
      initialRoute: '/',
      theme: ThemeData(
        primaryColor: Colors.green.shade200,
      ),
    );
  }
}
