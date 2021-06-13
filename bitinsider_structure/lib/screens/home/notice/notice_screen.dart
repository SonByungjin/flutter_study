import 'package:bitinsider_structure/widgets/global_scaffold.dart';
import 'package:flutter/material.dart';

class NoticeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: '공지사항',
      bottomIdx: 1,
      body: DefaultTabController(
        length: 3,
        child: Builder(
          builder: (BuildContext context) {
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
                        '안내',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '이벤트',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  children: [
                    Center(
                      child: Text('전체'),
                    ),
                    Center(
                      child: Text('안내'),
                    ),
                    Center(
                      child: Text('이벤트'),
                    ),
                  ],
                ))
              ],
            );
          },
        ),
      ),
    );
  }
}
