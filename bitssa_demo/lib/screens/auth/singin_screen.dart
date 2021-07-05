import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';
import '../../bloc/auth/auth_state.dart';

class SignInScreen extends StatelessWidget {
  final controllerID = TextEditingController();
  final controllerPW = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
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
                  Container(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                      onPressed: () {
                        if (controllerID.text.isEmpty ||
                            controllerPW.text.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('로그인 오류'),
                                  content: Text(
                                      '유효하지 않은 이메일 주소 또는 비밀번호 입니다. 다시 확인 후 입력 해 주세요.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('닫기'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('확인'),
                                    ),
                                  ],
                                );
                              }
                            );
                          } else {
                          BlocProvider.of<AuthBloc>(context).add(LogIn(
                            id: controllerID.text,
                            pw: controllerPW.text
                          ));
                        }
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ]
              ),
              SizedBox(),
            ]
          )
        )
      )
    );
  }
}