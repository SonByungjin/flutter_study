import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:router_project/main.dart';

class ZeroPage extends StatelessWidget {
  String getId(id) {
    return id + '님 환영합니다';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'HOME',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.cyan.shade50,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  (Provider.of<ProviderText>(context).idValue == '')
                      ? '로그인 해주세요'
                      : getId(Provider.of<ProviderText>(context).idValue),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 200,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.greenAccent.shade100)),
                  child: Text(
                    (Provider.of<ProviderText>(context).idValue == '')
                        ? '로그인'
                        : '로그아웃',
                    style: TextStyle(
                        color: Colors.teal.shade500,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
