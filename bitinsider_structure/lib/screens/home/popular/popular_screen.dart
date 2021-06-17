import 'package:bitinsider_structure/utils/constant.dart';
import 'package:bitinsider_structure/widgets/global_scaffold.dart';
import 'package:flutter/material.dart';

class PopularScreen extends StatelessWidget {
  final popularSeachCtx = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      scaffoldType: ScaffoldType.HOME,
      appBarSearchCtrl: popularSeachCtx,
      title: '인기글',
      bottomIdx: 3,
      body: DefaultTabController(
        length: 5,
        child: Builder(builder: (BuildContext context) {
          return Column(
            children: [
              SizedBox(
                height: 50,
                child: TabBar(
                  tabs: [
                    Text(
                      '전체',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '비트맨',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '코인판',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '코박',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      'ETC',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text('전체')),
                    Center(child: Text('비트맨')),
                    Center(child: Text('코인판')),
                    Center(child: Text('코박')),
                    Test(),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('탭바뷰 빌드');
    return Center(child: Text('ETC'));
  }
}

