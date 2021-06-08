import 'package:bitinsider_structure/bloc/auth/auth_bloc.dart';
import 'package:bitinsider_structure/bloc/auth/auth_event.dart';
import 'package:bitinsider_structure/bloc/auth/auth_state.dart';
import 'package:bitinsider_structure/widgets/global_drawer.dart';
import 'package:bitinsider_structure/widgets/global_bottomnavigator.dart';
import 'package:bitinsider_structure/widgets/global_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MypageScreen extends StatefulWidget {
  @override
  _MypageScreenState createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(SendAuth());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
                appBar: GlobalAppBar(['회원정보', '로그인 기록', '비밀번호 변경'], '마이페이지'),
          body: BlocBuilder<AuthBloc, AuthState>(
            builder: (_, state) {
              if(state is Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Loaded) {
                return TabBarView(children: [
                  Center(child: Text('회원정보')),
                  Center(child: Text('로그인 기록')),
                  Center(child: Text('비밀번호 변경')),
                ]);
              }
              return Container();
            },
          ),
          bottomNavigationBar: GlobalBottomNav(-1),
          drawer: Drawer(
            child: GlobalDrawer(),
          ),
        ),
      ),
    );
  }
}
