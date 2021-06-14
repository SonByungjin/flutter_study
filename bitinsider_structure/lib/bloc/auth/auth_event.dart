abstract class AuthEvent{}

class ReceiveAuth extends AuthEvent {}

class removeAuth extends AuthEvent {}

class SendAuth extends AuthEvent {
  final String id;
  final String pw;

  SendAuth({this.id, this.pw});
}

