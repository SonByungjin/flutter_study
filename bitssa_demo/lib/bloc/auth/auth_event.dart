abstract class AuthEvent{}

class LogCheck extends AuthEvent {}

class LogOut extends AuthEvent {}

class LogIn extends AuthEvent {
  final String id;
  final String pw;

  LogIn({this.id, this.pw});
}

