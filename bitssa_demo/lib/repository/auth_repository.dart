enum userInfoKind {
    ID,
    PASSWORD
}

class AuthRepository {
    Map<userInfoKind, String> userInfo {
        userInfoKind.ID : '',
        userInfoKind.PASSWORD : '',
    }

    Future<Map> currentUser async {
        return userInfo;
    }

    Future<Map> resisterUser(String id, String pw) async {
        userInfo[userInfoKind.ID] = id;
        userInfo[userInfoKind.PASSWORD] = pw;

        return userInfo;
    }

    Future<Map> removeUser() async {
        userInfo[userInfoKind.ID] = '';
        userInfo[userInfoKind.PASSWORD] = '';

        return userInfo;
    }
}