abstract class PostEvent{}

class LandingPost extends PostEvent {}

class UploadPost extends PostEvent {
    final String title;
    final String content;
    final String user;
    
    UploadPost({
        @required this.title,
        @required this.content,
        @required this.user,        
    })
}

class DeletePost extends PostEvent {
    final Number idx;

    DeletePost({
        @required this.idx
    })
}