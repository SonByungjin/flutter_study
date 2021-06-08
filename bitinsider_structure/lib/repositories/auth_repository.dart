class AuthRepository {
  Future<String> receiveAuth() async{
    await Future.delayed(Duration(seconds: 3));

    return 'test';
  }
}