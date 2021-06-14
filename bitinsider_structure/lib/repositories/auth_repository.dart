class AuthRepository {
  Map userInfo = {
    'ID' : '',
    'PASSWORD': '',
  };

  Future<Map> currentUser() async {

    return userInfo;
  }

  Future<Map> resisterUser(String id, String pw) async {
    userInfo['ID'] = id;
    userInfo['PASSWORD'] = pw;

    return userInfo;
  }

  Future<Map> removeUser() async {
    userInfo['ID'] = '';
    userInfo['PASSWORD'] = '';

    return userInfo;
  }
}