import 'package:flutter/material.dart';

class CorrectBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text(
            '예',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        SizedBox(width: 30),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              '아니오',
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}

class WrongBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              '돌아가기',
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
