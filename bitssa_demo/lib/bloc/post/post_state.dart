import '../../repository/post_repository.dart';

abstract class PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<POST> postList;

  PostLoaded(this.postList);
}

class PostError extends PostState {
  final String message;

  PostError(this.message);
}
