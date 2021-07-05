abstract class PostEvent {}

class LandingPost extends PostEvent {}

class UploadPost extends PostEvent {
  final String title;
  final String content;
  final String user;

  UploadPost({
    this.title,
    this.content,
    this.user,
  });
}

class DeletePost extends PostEvent {
  final int idx;

  DeletePost({this.idx});
}
