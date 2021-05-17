import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final textController = TextEditingController();
  List<bool> selectArr = [true, false, false];
  String tip;
  double textSize = 40;

  void pressFunc(int idx) {
    setState(() {
      for (int i = 0; i < selectArr.length; i++) {
        selectArr[i] = (idx == i);
      }
    });
  }

  void calculFunc () {
    final double totalAmount = double.parse(textController.text);
    final int selctedIdx = selectArr.indexWhere((element) => element);
    const feeList = [0.1, 0.2, 0.3];
    final String finalValue = (totalAmount * feeList[selctedIdx]).toStringAsFixed(2);
    setState(() {
      tip = finalValue;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(tip != null)Text(tip),
                Text('hello flutter'),
                SizedBox(
                  width: 70,
                  child: TextField(
                    controller: textController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: '\$100.00'),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ToggleButtons(
                    children: [Text('10'), Text('20'), Text('30')],
                    isSelected: selectArr,
                    onPressed: pressFunc,
                  ),
                ),
                TextButton(
                  onPressed: calculFunc,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.teal),
                  ),
                  child: Text(
                    'calcul',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 50),
                Expanded(
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    // 도당체 뭐 기능인지 모르겠음
                    style: TextStyle(fontSize: textSize),
                    maxLines: null,
                  ),
                ),
                Slider(value: textSize, onChanged: (e){
                  setState(() {
                    textSize = e;
                  });
                }, min: 30, max: 200,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
