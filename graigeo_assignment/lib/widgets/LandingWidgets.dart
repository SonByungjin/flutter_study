import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graigeo_assignment/bloc/bloc_cubit.dart';
import 'package:graigeo_assignment/bloc/heart_bloc.dart';
import 'package:graigeo_assignment/bloc/heart_event.dart';
import 'package:graigeo_assignment/bloc/heart_state.dart';

class ProductsList extends StatefulWidget {
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final prodNames = [
    '파인더',
    '아이폰',
    '텀블러',
    '충전기',
    '과자',
    '피그마',
    '애플',
    '맥북',
    '전원',
    '포스트잇',
  ];

  @override
  Widget build(BuildContext context) {
    print('상품 스크린 빌드');
    return BlocBuilder<HeartCubit, HeartState>(
      builder: (_, state) {
        if (state is Empty) {
          return Container();
        } else if (state is Error) {
          return Text(state.message);
        } else if (state is Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is Loaded) {
          final heartList = state.hearts;
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
                    children: prodNames.map((el) {
                      final isHeart = heartList.firstWhere(
                          (element) => element == el,
                          orElse: () => 'none');
                      return Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                // 이벤트를 호출하는 두가지 방식이 있다 BlocProvider / context.read
                                // isHeart == 'none'
                                //   ? BlocProvider.of<HeartBloc>(context)
                                //       .add(CreateHeartEvent(el))
                                //    : BlocProvider.of<HeartBloc>(context)
                                //       .add(DeleteHeartEvent(el));
                                isHeart == 'none'
                                    ? context.read<HeartCubit>().createHeart(el)
                                    : context.read<HeartCubit>().deleteHeart(el);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                  color: isHeart != 'none'
                                      ? Color.fromRGBO(247, 50, 78, 1)
                                      : Colors.indigoAccent.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            el,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: SizedBox(
            child: GridView.count(
              childAspectRatio: 1.5,
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.filled(
                10,
                Column(
                  children: [Icon(Icons.checkroom), Text('Category')],
                ),
              ),
            ),
          ),
        ),
      ],
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
        tabs: tabs.length > 1
            ? tabs
                .map((tabName) => Container(
                      alignment: Alignment.center,
                      width: 80,
                      child: Text(
                        tabName,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ))
                .toList()
            : [Container(color: Colors.transparent)],
      ),
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
