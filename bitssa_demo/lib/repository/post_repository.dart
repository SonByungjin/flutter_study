import 'dart:convert';
import 'package:http/http.dart' as http;

class POST {
  final String title;
  final String content;
  final String date;
  final String user;

  POST({this.title, this.content, this.date, this.user});

  factory POST.fromJson(Map<String, dynamic> json) {
    return POST(
      title: json['title'].toString(),
      content: json['id'].toString(),
      date: DateTime.now().toString(),
      user: json['id'].toString(),
    );
  }
}

class PostRepository {
  List<POST> postList = [
    POST(title: '제목', content: '내용', date: '날짜', user: '유저'),
  ];

  Future<List<POST>> currentPost() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      final rsp = POST.fromJson(jsonDecode(response.body));
      postList.add(rsp);
    } else {
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
