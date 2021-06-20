import 'package:bitinsider_structure/utils/constant.dart';
import 'package:bitinsider_structure/widgets/global_scaffold.dart';
import 'package:flutter/material.dart';

class PopularScreen extends StatelessWidget {
  final popularSeachCtx = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      scaffoldType: ScaffoldType.SEARCH,
      appBarSearchCtrl: popularSeachCtx,
      title: '인기글 TOP',
      bottomIdx: 3,
      body: DefaultTabController(
        length: 5,
        child: Builder(builder: (BuildContext context) {
          return Column(
            children: [
              SizedBox(
                height: 50,
                child: TabBar(
                  indicatorColor: Colors.redAccent,
                  labelColor: Colors.redAccent,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Text('전체'),
                    Text('비트맨'),
                    Text('코인판'),
                    Text('코박'),
                    Text('ETC'),
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

