import 'package:flutter/material.dart';
import 'package:graigeo_assignment/widgets/LandingWidgets.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title:
                Text(
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
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              // isScrollable: true,
              tabs: [
                Container(
                  alignment: Alignment.center,
                  width: 80,
                  child: Text(
                    '상 품',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 80,
                  child: Text(
                    '카테고리',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                )
              ],
            ),
            iconTheme: IconThemeData(color: Colors.black),
          ),
          body: TabBarView(
            children: [
              ProductsList(),
              CategoryList(),
            ],
          ),
          drawer: Drawer(
            child: Container(
              color: Colors.redAccent.shade100,
            ),
          ),
          bottomNavigationBar: BottomNavigator(),
        ),
      ),
    );
  }
}
