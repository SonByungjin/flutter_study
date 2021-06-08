abstract class AuthState {}

class Loading extends AuthState {}

class Loaded extends AuthState {
  final String test;

  Loaded(this.test);
}

class Error extends AuthState {
  final String message;

  Error(this.message);
}