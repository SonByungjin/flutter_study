import 'package:flutter_bloc/flutter_bloc.dart';

// 데이터 저장소이자 서버 통신이 이루어지는 곳
class HeartRepository {
  Future<List<String>> listHeart() async{
    await Future.delayed(Duration(seconds: 3));

    return ['아이폰'];
  }

  Future<List<String>> createHeart(List<String> prevState, String heartItem) async {

    return [...prevState, heartItem];
  }

  Future<List<String>> deleteHeart(List<String> prevState, String heartItem) async {

    return prevState.where((heart) => heart != heartItem).toList();
  }
}