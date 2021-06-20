import 'package:bitinsider_structure/utils/constant.dart';
import 'package:bitinsider_structure/widgets/global_scaffold.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatelessWidget {
  final priceScreenSearchCtx = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      scaffoldType: ScaffoldType.SEARCH,
      appBarSearchCtrl: priceScreenSearchCtx,
      title: '실시간 시세',
      bottomIdx: 0,
      body: Center(
        child: Text('실시간 시세'),
      ),
    );
  }
}
