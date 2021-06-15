import 'package:flutter/material.dart';
import 'package:bitinsider_structure/widgets/global_scaffold.dart';

class LandingScreen extends StatefulWidget {
  final String searchTxt;
  LandingScreen(this.searchTxt);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState(){

  }
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'BITINSIDER',
      bottomIdx: 2,
      body: Center(
        child: Column(
          children: [
            Text('홈'),
            TextButton(
              onPressed: () {
                print(widget.searchTxt);
              },
              child: Text('버튼'),
            ),
          ],
        ),
      ),
    );
  }
}
