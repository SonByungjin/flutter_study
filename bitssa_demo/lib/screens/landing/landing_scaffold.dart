import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bitssa_demo/bloc/auth/auth_bloc.dart';
import 'package:bitssa_demo/bloc/auth/auth_state.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/post/post_bloc.dart';
import '../../bloc/post/post_event.dart';
import '../../bloc/post/post_state.dart';
import '../../repository/auth_repository.dart';

class LandingScaffold extends StatefulWidget {
  @override
  _LandingScaffoldState createState() => _LandingScaffoldState();
}

class _LandingScaffoldState extends State<LandingScaffold> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostBloc>(context).add(LandingPost());
  }
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 2,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              title: Text(
                'MISS U',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            body: TabBarView(
              children: [
                Center(
                  child: BlocBuilder<PostBloc, PostState>(
                    builder: (_, state) {
                      return Text('0');
                    },
                  ),
                ),
                Center(
                  child: Text('1'),
                ),
                Center(
                  child: Text('2'),
                ),
                Center(
                  child: Text('3'),
                ),
                Center(
                  child: Text('4'),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.green.shade100,
              ),
              padding: EdgeInsets.symmetric(vertical: 15),
              child: TabBar(
                unselectedLabelColor: Colors.white,
                labelColor: Colors.green.shade400,
                indicatorColor: Colors.transparent,
                tabs: [
                  Icon(Icons.favorite),
                  Icon(Icons.star),
                  Icon(Icons.home_filled),
                  Icon(Icons.wb_sunny),
                  Icon(Icons.filter_vintage),
                ],
              ),
            ),
            drawer: Drawer(
              child: BlocListener<AuthBloc, AuthState>(
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (_, state) {
                    bool isLogged = false;
                    if (state is Loaded) {
                      isLogged =
                          state.userInfo[userInfoKind.ID].length > 0;
                    }
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 150,
                              child: Center(
                                  child: CircleAvatar()
                              )
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height - 300,
                              child: Column(
                                  children: [
                                    // 리스트뷰(CScenter, setting)
                                    DrawerList(),
                                    // auth btn
                                    DrawerBtn()
                                  ]
                              )
                          ),
                        ]
                    );
                  },
                ),
              ),
            )
        ),
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  final List<String> drawerConstant = ['고객센터', '설정'];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: drawerConstant.length,
            itemBuilder: (BuildContext context, int idx) {
              print(drawerConstant[idx]);
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Text(drawerConstant[idx]),
              );
            }
        )
    );
  }
}

class DrawerBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          TextButton(child: Text('로그인'),),
          SizedBox(),
          TextButton(child: Text('회원가입'),)
        ]
    );
  }
}