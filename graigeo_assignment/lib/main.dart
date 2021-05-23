import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:graigeo_assignment/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderHeart>(
      create: (context) => ProviderHeart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        title: 'graigeo_assignment',
        routes: routes,
      ),
    );
  }
}

class ProviderHeart extends ChangeNotifier {
  List heatProducts = [];
}
