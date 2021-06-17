import 'package:bitinsider_structure/utils/constant.dart';
import 'package:bitinsider_structure/widgets/global_scaffold.dart';
import 'package:flutter/material.dart';

class ExchangeNoticeScreen extends StatelessWidget {
  final exchangeSearchCtx = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      scaffoldType: ScaffoldType.HOME,
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
                    tabs: [
                      Text(
                        '전체',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '빗썸',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '업비트',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '바이낸스',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '후오비',
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
