import 'package:flutter/material.dart';
import 'package:router_project/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderText>(
      create: (context) => ProviderText(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'router_project',
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}

class ProviderText extends ChangeNotifier {
  String idValue = '';

  void changeText(newValue){
    idValue = newValue;
    notifyListeners();
  }
}
