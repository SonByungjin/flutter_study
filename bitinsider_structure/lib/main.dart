import 'package:bitinsider_structure/bloc/auth/auth_bloc.dart';
import 'package:bitinsider_structure/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:bitinsider_structure/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => AuthBloc(AuthRepository()))],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bitinsider_structure',
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
