import 'package:flutter/material.dart';

class GlobalDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            child: Icon(Icons.settings),
            onTap: () {
              Navigator.pushNamed(context, '/setting');
            },
          ),
          InkWell(
            child: Text('마이페이지'),
            onTap: () {
              Navigator.pushNamed(context, '/mypage');
            },
          )
        ],
      ),
    );
  }
}
