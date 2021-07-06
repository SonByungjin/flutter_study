import 'package:bitssa_demo/bloc/post/post_bloc.dart';
import 'package:bitssa_demo/bloc/post/post_event.dart';
import 'package:bitssa_demo/bloc/post/post_state.dart';
import 'package:bitssa_demo/repository/post_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostBloc>(context).add(LandingPost());
  }

  Widget build(BuildContext context) {
    return BlocListener<PostBloc, PostState>(listener: (context, state) {
      if (state is PostError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.message),
          ),
        );
      }
    }, child: BlocBuilder<PostBloc, PostState>(
      builder: (_, state) {
        List<POST> postArr = [];
        if (state is PostLoaded) {
          postArr = state.postList;
        } else if (state is PostLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: postArr
              .map(
                (e) => Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(e.title),
                      Text(e.date),
                    ],
                  ),
                ),
              )
              .toList(),
        );
      },
    ));
  }
}
