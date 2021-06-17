import 'package:bitinsider_structure/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:bitinsider_structure/widgets/global_scaffold.dart';

class LandingScreen extends StatefulWidget {

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final landingScreenSearchCtx = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      scaffoldType: ScaffoldType.HOME,
      title: 'BITINSIDER',
      bottomIdx: 2,
      appBarSearchCtrl: landingScreenSearchCtx,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('홈'),
            TextButton(
              onPressed: () {
                print(landingScreenSearchCtx.text);
              },
              child: Text('버튼'),
            ),
          ],
        ),
      ),
    );
  }
}
