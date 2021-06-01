import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graigeo_assignment/bloc/heart_state.dart';
import 'package:graigeo_assignment/repository/heartRepository.dart';

class HeartCubit extends Cubit<HeartState> {
  final HeartRepository repository;

  HeartCubit(this.repository): super(Empty());

  listHeart() async {
    try {
      emit(Loading());

      final response = await this.repository.listHeart();

      final hearts = response;

      emit(Loaded(hearts));

    }catch(e) {
      emit(Error(e.message));
    }
  }

  createHeart(String item) async {
    try {
      if(state is Loaded) {
        final parsedState = (state as Loaded);

        final newHeart = item;

        final prevHearts = [...parsedState.hearts];
        final newHearts = [...prevHearts, newHeart];

        emit(Loaded(newHearts));
      }

    }catch(e) {
      emit(Error(e.message));
    }
  }

  deleteHeart(String item) async {
    try {
      if(state is Loaded) {
        final newHearts = (state as Loaded)
            .hearts
            .where((heart) => heart != item)
            .toList();

        emit(Loaded(newHearts));

        await repository.deleteHeart(item);
      }

    }catch(e) {
      emit(Error(e.message));
    }
  }

}