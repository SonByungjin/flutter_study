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

    Future<List> currentPost async {
        return postList;
    }

    Future<Map> addPost(String title, String content, String user) async {
        postList.add({
            postProps.TITLE: title,
            postProps.CONTENT: content,
            postProps.DATE: DateTime.now(),
            postProps.USER: user,
        })
        return postList;
    }

    Future<Map> subtractPost(Number idx) async {
        postList.removeAt(idx);
        return postList;
    }
}