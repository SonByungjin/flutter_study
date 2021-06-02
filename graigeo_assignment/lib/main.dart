import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graigeo_assignment/bloc/bloc_cubit.dart';
import 'package:graigeo_assignment/bloc/heart_bloc.dart';
import 'package:graigeo_assignment/repository/heartRepository.dart';
import 'package:graigeo_assignment/routes.dart';

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
    return BlocProvider(
      create: (_) => HeartCubit(HeartRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        title: 'graigeo_assignment',
        routes: routes,
      ),
    );
  }
}
