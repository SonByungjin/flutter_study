import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('배너 자리'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '추천 상품',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: List.filled(
                10,
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Text('상품 이름')
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.shade100,
    );
  }
}

class BottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(icon: Icon(Icons.title), onPressed: () {}),
          IconButton(icon: Icon(Icons.title), onPressed: () {}),
          IconButton(icon: Icon(Icons.title), onPressed: () {})
        ],
      ),
    );
  }
}
