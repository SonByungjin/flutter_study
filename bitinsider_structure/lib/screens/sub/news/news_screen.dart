import 'package:bitinsider_structure/utils/constant.dart';
import 'package:bitinsider_structure/widgets/global_scaffold.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  final newsSearchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'NEWS',
      bottomIdx: -1,
      scaffoldType: ScaffoldType.SEARCH,
      appBarSearchCtrl: newsSearchCtrl,
      body: DefaultTabController(
        length: 5,
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
                  Text('블록미디어'),
                  Text('토큰포스트'),
                  Text('블록포스트'),
                  Text('조인디'),
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
                    child: Text('블록미디어'),
                  ),
                  Center(
                    child: Text('토큰포스트'),
                  ),
                  Center(
                    child: Text('블록포스트'),
                  ),
                  Center(
                    child: Text('조인디'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
