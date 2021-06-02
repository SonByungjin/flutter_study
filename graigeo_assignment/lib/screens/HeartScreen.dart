import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graigeo_assignment/bloc/bloc_cubit.dart';
import 'package:graigeo_assignment/bloc/heart_bloc.dart';
import 'package:graigeo_assignment/bloc/heart_state.dart';

class HeartScreen extends StatefulWidget {
  @override
  _HeartScreenState createState() => _HeartScreenState();
}

class _HeartScreenState extends State<HeartScreen> {
  @override
  Widget build(BuildContext context) {
    // 위젯 다시 빌드 되지 않고 해당 ui 만 바뀐다
    print('하트 스크린 빌드');
    return BlocBuilder<HeartCubit, HeartState>(
      builder: (_, state) {
        if (state is Empty) {
          return Container();
        } else if (state is Error) {
          return Text(state.message);
        } else if (state is Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is Loaded) {
          print('로딩완료 찜한 상품');
          final heartList = state.hearts;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: heartList.map((el) {
                return Text(
                  el,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                );
              }).toList(),
            ),
          );
        }
        return Container();
      },
    );
  }
}
