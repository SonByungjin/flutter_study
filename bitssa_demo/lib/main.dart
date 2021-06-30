import 'package:bitssa_demo/routes.dart';
import 'package:bitssa_demo/bloc/auth/auth_bloc';
import 'package:bitssa_demo/bloc/post/post_bloc';
import 'package:bitssa_demo/repository/auth_repository';
import 'package:bitssa_demo/repository/post_repository';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> AuthBloc(AuthRepository())),
        BlocProvider(create: (_)=> PostBloc(PostRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: routes,
        initialRoute: '/',
        theme: ThemeData(
          primaryColor: Colors.green.shade200,
        ),
      ),
    );
  }
}

