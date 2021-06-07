import 'package:bitinsider_structure/widgets/GlabalDrawer.dart';
import 'package:bitinsider_structure/widgets/GlobalBottomNav.dart';
import 'package:bitinsider_structure/widgets/GlobalAppBar.dart';
import 'package:flutter/material.dart';

class MypageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: GlobalAppBar(['회원정보', '로그인 기록', '비밀번호 변경'], '마이페이지'),
              body: TabBarView(
                children: [
                  Center(child: Text('회원정보')),
                  Center(child: Text('로그인 기록')),
                  Center(child: Text('비밀번호 변경')),
                ],
              ),
              bottomNavigationBar: GlobalBottomNav(-1),
              drawer: Drawer(
                child: GlobalDrawer(),
              ),
            );
          },
        ),
      ),
    );
  }
}
