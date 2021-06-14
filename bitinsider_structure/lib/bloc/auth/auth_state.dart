abstract class AuthState {}

class Loading extends AuthState {}

class Loaded extends AuthState {
  final Map userInfo;

  Loaded(this.userInfo);
}

class Error extends AuthState {
  final String message;

  Error(this.message);
}