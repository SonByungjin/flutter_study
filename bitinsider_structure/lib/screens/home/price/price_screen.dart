import 'package:bitinsider_structure/widgets/global_scaffold.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: '실시간 시세',
      bottomIdx: 0,
      body: Center(
        child: Text('실시간 시세'),
      ),
    );
  }
}
