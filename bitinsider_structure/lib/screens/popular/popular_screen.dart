import 'package:bitinsider_structure/widgets/global_drawer.dart';
import 'package:bitinsider_structure/widgets/global_bottomnavigator.dart';
import 'package:bitinsider_structure/widgets/global_appbar.dart';
import 'package:flutter/material.dart';

class PopularScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: GlobalAppBar(['전체', '업비트', '코인판', '코박', 'ETC'], '인기글'),
              body: TabBarView(
                children: [
                  Center(child: Text('전체')),
                  Center(child: Text('업비트')),
                  Center(child: Text('코인판')),
                  Center(child: Text('코박')),
                  Center(child: Text('ETC')),
                ],
              ),
              bottomNavigationBar: GlobalBottomNav(3),
              drawer: GlobalDrawer(),
            );
          },
        ),
      ),
    );
  }
}
