import 'package:bitinsider_structure/utils/constant.dart';
import 'package:bitinsider_structure/widgets/global_scaffold.dart';
import 'package:flutter/material.dart';

class ExchangeNoticeScreen extends StatelessWidget {
  final exchangeSearchCtx = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      scaffoldType: ScaffoldType.SEARCH,
      appBarSearchCtrl: exchangeSearchCtx,
      title: '거래소 공지',
      bottomIdx: 1,
      body: DefaultTabController(
        length: 5,
        child: Builder(
          builder: (BuildContext context) {
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
                      Text('빗썸'),
                      Text('업비트'),
                      Text('바이낸스'),
                      Text('후오비'),
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
                      child: Text('빗썸'),
                    ),
                    Center(
                      child: Text('업비트'),
                    ),
                    Center(
                      child: Text('바이낸스'),
                    ),
                    Center(
                      child: Text('후오비'),
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
