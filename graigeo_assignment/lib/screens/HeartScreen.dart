import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graigeo_assignment/bloc/heart_cubit.dart';
import 'package:graigeo_assignment/bloc/heart_state.dart';

class HeartScreen extends StatefulWidget {
  @override
  _HeartScreenState createState() => _HeartScreenState();
}

class _HeartScreenState extends State<HeartScreen> {
  @override
  Widget build(BuildContext context) {
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
