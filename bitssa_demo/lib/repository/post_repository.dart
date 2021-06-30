enum postProps {
  TITLE,
  CONTENT,
  DATE,
  USER,
}

class PostRepository {
  List<Map<postProps, String>> postList [
    {
      postProps.TITLE: '',
      postProps.CONTENT: '',
      postProps.DATE: '',
      postProps.USER: '',
    },
  ]

  Future<List<Map<postProps, String>>> currentPost async {
    return postList;
  }

  Future<List<Map<postProps, String>>> addPost(String title, String content, String user) async {
    postList.add({
      postProps.TITLE: title,
      postProps.CONTENT: content,
      postProps.DATE: DateTime.now(),
      postProps.USER: user,
    })
    return postList;
  }

  Future<List<Map<postProps, String>>> subtractPost(Number idx) async {
    postList.removeAt(idx);
    return postList;
  }
}