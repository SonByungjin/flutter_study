abstract class HeartState {}

class Empty extends HeartState {}

class Loading extends HeartState {}

class Error extends HeartState {
  final String message;

  Error(this.message);
}

class Loaded extends HeartState {
  final List<String> hearts;

  Loaded(this.hearts);
}
