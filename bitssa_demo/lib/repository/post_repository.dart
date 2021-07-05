import 'dart:convert';

import 'package:http/http.dart' as http;

enum postProps {
  TITLE,
  CONTENT,
  DATE,
  USER,
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class PostRepository {
  List<Map<postProps, String>> postList = [
    {
      postProps.TITLE: '',
      postProps.CONTENT: '',
      postProps.DATE: '',
      postProps.USER: '',
    },
  ];

  Future<List<Map<postProps, String>>> currentPost() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final rsp = Album.fromJson(jsonDecode(response.body));
      print(rsp.userId);
      print(rsp.id);
      print(rsp.title);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
    return postList;
  }

  Future<List<Map<postProps, String>>> addPost(
      String title, String content, String user) async {
    postList.add({
      postProps.TITLE: title,
      postProps.CONTENT: content,
      postProps.DATE: DateTime.now().toString(),
      postProps.USER: user,
    });
    return postList;
  }

  Future<List<Map<postProps, String>>> subtractPost(int idx) async {
    postList.removeAt(idx);
    return postList;
  }
}
