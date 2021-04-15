import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test app',
      home: TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  @override
  _testPageState createState() => _testPageState();
}

class _testPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          // initialUrl: 'https://www.wiprex.com/',
          initialUrl: 'http://192.168.0.201:9080/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
