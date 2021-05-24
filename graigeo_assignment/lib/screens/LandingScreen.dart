import 'package:flutter/material.dart';
import 'package:graigeo_assignment/widgets/LandingWidgets.dart';
import 'package:graigeo_assignment/widgets/Swiper.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int currentTab = 1;
  Map appBarConstant = {
    0: [],
    1: ['상품', '카테고리'],
    2: ['찜한 상품', '최근 본 상품']
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: currentTab == 0 ? 0 : 2,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: LandingAppBar(appBarConstant[currentTab]),
          body: IndexedStack(
            children: [
              SwiperWidget(),
              TabBarView(
                children: [
                  ProductsList(),
                  CategoryList(),
                ],
              ),
              TabBarView(children: [
                Container(
                  color: Colors.greenAccent.shade100,
                ),
                Container(
                  color: Colors.pink.shade50,
                )
              ]),
            ],
            index: currentTab,
          ),
          drawer: Drawer(
            child: Container(
              color: Colors.redAccent.shade100,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                currentTab = index;
              });
            },
            currentIndex: currentTab,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.grid_view,
                  color: currentTab == 0
                      ? Color.fromRGBO(247, 50, 78, 1)
                      : Colors.grey.shade400,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.ac_unit_rounded,
                    color: currentTab == 1
                        ? Color.fromRGBO(247, 50, 78, 1)
                        : Colors.grey.shade400,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    currentTab == 2 ? Icons.favorite : Icons.favorite_border,
                    color: currentTab == 2
                        ? Color.fromRGBO(247, 50, 78, 1)
                        : Colors.grey.shade400,
                  ),
                  label: ''),
            ],
          ),
        ),
      ),
    );
  }
}
