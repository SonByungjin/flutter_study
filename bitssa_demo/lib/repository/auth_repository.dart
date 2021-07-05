enum userInfoKind {
  ID,
  PASSWORD
}

class AuthRepository {
  Map<userInfoKind, String> userInfo = {
    userInfoKind.ID : '',
    userInfoKind.PASSWORD : '',
  };

  Future<Map<userInfoKind, String>> currentUser() async {
    return userInfo;
  }

  Future<Map<userInfoKind, String>> resisterUser(String id, String pw) async {
    userInfo[userInfoKind.ID] = id;
    userInfo[userInfoKind.PASSWORD] = pw;

    return userInfo;
  }

  Future<Map<userInfoKind, String>> removeUser() async {
    userInfo[userInfoKind.ID] = '';
    userInfo[userInfoKind.PASSWORD] = '';

    return userInfo;
  }
}