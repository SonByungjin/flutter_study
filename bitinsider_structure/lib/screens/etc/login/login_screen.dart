import 'package:bitinsider_structure/bloc/auth/auth_bloc.dart';
import 'package:bitinsider_structure/bloc/auth/auth_event.dart';
import 'package:bitinsider_structure/bloc/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controllerID = TextEditingController();
  final controllerPW = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state is Loaded && state.userInfo['ID'].length > 0) {
            Navigator.pushNamed(context, '/');
        }
      },
      child: Material(
        child: Container(
          color: Colors.white,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextField(
                        controller: controllerID,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ID',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: controllerPW,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(SendAuth(
                              id: controllerID.text, pw: controllerPW.text));
                        },
                        child: Text('LOGIN'),
                      )
                    ],
                  ),
                  SizedBox()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
