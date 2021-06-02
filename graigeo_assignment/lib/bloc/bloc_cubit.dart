import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graigeo_assignment/bloc/heart_state.dart';
import 'package:graigeo_assignment/repository/heartRepository.dart';

class HeartCubit extends Cubit<HeartState> {
  final HeartRepository repository;

  HeartCubit(this.repository): super(Empty());

  listHeart() async {
    try {
      emit(Loading());

      // 서버 통신 (repository) 연결;
      final response = await this.repository.listHeart();

      emit(Loaded(response));

    } catch (e) {
      emit(Error(e.message));
    }
  }

  createHeart(String item) async {
    try {
      // yield 된 모든 값은 state 로 가져올 수 있다
      if(state is Loaded) {
        final parsedState = (state as Loaded);

        final respHearts =  await repository.createHeart(parsedState.hearts ,item);

        emit(Loaded(respHearts));

      }
    } catch (e) {
      emit(Error(e.message));
    }
  }

  deleteHeart(String item) async {
    try {
      if(state is Loaded) {
        final parsedState = (state as Loaded);

        final respHearts = await repository.deleteHeart(parsedState.hearts, item);

        emit(Loaded(respHearts));

      }
    } catch (e) {
      emit(Error(e.message));
    }
  }
}