import 'package:bitinsider_structure/bloc/auth/auth_bloc.dart';
import 'package:bitinsider_structure/bloc/auth/auth_event.dart';
import 'package:bitinsider_structure/bloc/auth/auth_state.dart';
import 'package:bitinsider_structure/widgets/global_scaffold.dart';
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
    return MyScaffold(
      title: '마이페이지',
      bottomIdx: -1,
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TabBar(
                tabs: [
                  Text(
                    '회원정보',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    '로그인 기록',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    '비밀번호 변경',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (_, state) {
                  if (state is Loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is Loaded) {
                    return TabBarView(
                      children: [
                        Center(
                          child: Text('회원정보'),
                        ),
                        Center(
                          child: Text('로그인 기록'),
                        ),
                        Center(
                          child: Text('비밀번호 변경'),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
