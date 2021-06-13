import 'package:flutter/material.dart';
import 'package:bitinsider_structure/widgets/global_scaffold.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'BITINSIDER',
      bottomIdx: 2,
      body: Center(
        child: Text('홈'),
      ),
    );
  }
}
