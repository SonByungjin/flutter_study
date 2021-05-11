import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flash_card/flashcard_view.dart';
import 'package:flash_card/flashcard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<FlashCard> _flashCardQnA = [
    FlashCard('2', '1 + 1'),
    FlashCard('5', '1 + 4'),
    FlashCard('6', '3 + 3'),
  ];

  int _currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: FlipCard(
                  front: FlashCardView(_flashCardQnA[_currentIdx].question),
                  back: FlashCardView(_flashCardQnA[_currentIdx].answer),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      pagination(false);
                    },
                    icon: Icon(Icons.arrow_back),
                    label: Text('Back'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      pagination(true);
                    },
                    icon: Icon(Icons.arrow_forward),
                    label: Text('Next'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void pagination(bool toNext) {
    if (toNext) {
      setState(() {
        _currentIdx =
            _currentIdx + 1 < _flashCardQnA.length ? _currentIdx + 1 : 0;
      });
    } else {
      setState(() {
        _currentIdx =
            _currentIdx - 1 < 0 ? _flashCardQnA.length - 1 : _currentIdx - 1;
      });
    }
  }
}
