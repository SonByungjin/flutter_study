import 'package:flutter/material.dart';

class FlashCardView extends StatelessWidget {
  final String text;

  // FlashCardView({Key key, this.text}) : super(key: key);
  // 위젯에서 상태값을 받을때는 key, super 가 있어야 한다?
  FlashCardView(this.text);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(child: Text(text)),
    );
  }
}
