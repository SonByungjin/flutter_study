class UserInfo {
  String id;
  String password;

  UserInfo({this.id, this.password});
}

class AuthRepository {
  UserInfo userInfo = UserInfo(
    id: '',
    password: '',
  );

  Future<UserInfo> currentUser() async {
    return userInfo;
  }

  Future<UserInfo> resisterUser(String id, String pw) async {
    userInfo.id = id;
    userInfo.password = pw;

    return userInfo;
  }

  Future<UserInfo> removeUser() async {
    userInfo.id = '';
    userInfo.password = '';

    return userInfo;
  }
}