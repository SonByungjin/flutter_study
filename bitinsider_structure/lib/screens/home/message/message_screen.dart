import 'package:bitinsider_structure/widgets/global_scaffold.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String searchTxt = ModalRoute.of(context).settings.arguments;
    return MyScaffold(
      title: '메시지함',
      bottomIdx: 4,
      body: Center(
        child: Column(
          children: [
            Text('메시지함'),
            TextButton(
              onPressed: () {
                print(searchTxt);
              },
              child: Text('버튼'),
            ),
          ],
        ),
      ),
    );
  }
}
