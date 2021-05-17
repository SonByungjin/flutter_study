import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:router_project/main.dart';
import 'package:router_project/widgets/idCheckButton.dart';

class SecondPage extends StatelessWidget {
  final String id;
  final String pw;

  SecondPage(this.id, this.pw);

  bool inputRight() {
    if (id != '' && pw != '') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                inputRight() ? id + ' 계정으로 접속하시겠습니까?' : '회원정보를 모두 입력해주세요',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 30,),
            inputRight() ? CorrectBtn() : WrongBtn(),
          ],
        ),
      ),
    );
  }
}
