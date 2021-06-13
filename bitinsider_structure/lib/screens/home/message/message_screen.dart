import 'package:bitinsider_structure/widgets/global_scaffold.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: '메시지함',
      bottomIdx: 4,
      body: Center(
        child: Text('메시지함'),
      ),
    );
  }
}
