import 'package:bitinsider_structure/widgets/GlabalDrawer.dart';
import 'package:bitinsider_structure/widgets/GlobalBottomNav.dart';
import 'package:bitinsider_structure/widgets/GlobalAppBar.dart';
import 'package:flutter/material.dart';

class NoticeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: GlobalAppBar(['전체', '안내', '이벤트'], '공지사항'),
              body: TabBarView(
                children: [
                  Center(child: Text('전체')),
                  Center(child: Text('안내')),
                  Center(child: Text('이벤트')),
                ],
              ),
              bottomNavigationBar: GlobalBottomNav(1),
              drawer: GlobalDrawer(),
            );
          },
        ),
      ),
    );
  }
}
