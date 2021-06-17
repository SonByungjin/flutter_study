import 'package:bitinsider_structure/utils/constant.dart';
import 'package:bitinsider_structure/widgets/global_scaffold.dart';
import 'package:flutter/material.dart';

class PublicNoticeScreen extends StatelessWidget {
  final publicNoticeSeachCtx = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      scaffoldType: ScaffoldType.HOME,
      appBarSearchCtrl: publicNoticeSeachCtx,
      title: '공시',
      bottomIdx: 4,
      body: Center(
        child: Text('공시'),
      ),
    );
  }
}
