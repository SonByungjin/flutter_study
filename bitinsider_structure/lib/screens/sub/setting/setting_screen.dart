import 'package:bitinsider_structure/utils/constant.dart';
import 'package:bitinsider_structure/widgets/global_scaffold.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      scaffoldType: ScaffoldType.NONE,
      title: '설정',
      bottomIdx: -1,
      body: Center(
        child: Text('설정'),
      ),
    );
  }
}
