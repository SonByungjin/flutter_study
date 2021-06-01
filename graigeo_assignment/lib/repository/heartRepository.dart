import 'package:flutter_bloc/flutter_bloc.dart';

class HeartRepository {
  Future<List<String>> listHeart() async{
    await Future.delayed(Duration(seconds: 1));

    return ['아이폰'];
  }

  Future<String> createHeart(String heartItem) async {
    await Future.delayed(Duration(seconds: 1));

    return heartItem;
  }

  Future<String> deleteHeart(String heartItem) async {
    await Future.delayed(Duration(seconds: 1));

    return heartItem;
  }
}