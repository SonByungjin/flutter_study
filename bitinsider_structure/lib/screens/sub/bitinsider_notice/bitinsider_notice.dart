import 'package:bitinsider_structure/utils/constant.dart';
import 'package:bitinsider_structure/widgets/global_scaffold.dart';
import 'package:flutter/material.dart';

class BitinsiderNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        scaffoldType: ScaffoldType.SEARCH,
        title: 'Bitinsider 공지사항',
        bottomIdx: -1,
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: TabBar(
                  indicatorColor: Colors.redAccent,
                  labelColor: Colors.redAccent,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Text('전체'),
                    Text('안내'),
                    Text('이벤트'),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                    children: [
                      Center(child: Text('전체')),
                      Center(child: Text('안내')),
                      Center(child: Text('이벤트')),
                    ],
                  )
              )
            ],
          ),
        ));
  }
}
