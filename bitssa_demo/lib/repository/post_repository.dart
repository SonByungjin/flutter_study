import 'dart:convert';
import 'package:http/http.dart' as http;

class POST {
  final String title;
  final String content;
  final String date;
  final String user;

  POST({this.title, this.content, this.date, this.user});
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
  List<POST> postList = [
    POST(title: '', content: '', date: '', user: ''),
  ];

  Future<List<POST>> currentPost() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

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

  Future<List<POST>> addPost(String title, String content, String user) async {
    postList.add(POST(
      title: title,
      content: content,
      date: DateTime.now().toString(),
      user: user,
    ));
    return postList;
  }

  Future<List<POST>> subtractPost(int idx) async {
    postList.removeAt(idx);
    return postList;
  }
}
