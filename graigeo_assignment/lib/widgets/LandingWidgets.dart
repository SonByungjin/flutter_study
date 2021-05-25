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
    return Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]
            ),
            child: Expanded(
              child: GridView.count(
                crossAxisCount: 4, 
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.filled(10, Container(color: Colors.brown.shade100,),),),),
          )],
    );
  }
}

class LandingAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(100);
  final List tabs;
  LandingAppBar(this.tabs);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'GraiGeo',
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: 20,
            letterSpacing: -0.23999999463558197,
            fontWeight: FontWeight.normal,
            height: 1),
      ),
      bottom: TabBar(
        indicatorColor: tabs.length > 1 ? Colors.black : Colors.transparent,
        indicatorSize: TabBarIndicatorSize.label,
        // isScrollable: true,
        tabs: tabs.length > 1 ? tabs
            .map((tabName) => Container(
                  alignment: Alignment.center,
                  width: 80,
                  child: Text(
                    tabName,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ))
            .toList() : [
              Container(color: Colors.transparent)
            ],
      ),
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}

