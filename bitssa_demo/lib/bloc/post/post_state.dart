abstract class PostState {}

class Loading extends PostState {}

class Loaded extends PostState {
    final List postList;

    Loaded(this.postList);
}

class Error extends PostState {
    final String message;

    Error(this.message);
}