import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graigeo_assignment/bloc/heart_event.dart';
import 'package:graigeo_assignment/bloc/heart_state.dart';
import 'package:graigeo_assignment/repository/heartRepository.dart';

class HeartBloc extends Bloc<HeartEvent, HeartState> {
  final HeartRepository repository;

  HeartBloc(this.repository): super(Empty());

  // event 와 state 연결해준다
  @override
  Stream<HeartState> mapEventToState(HeartEvent event) async* {
    if(event is ListHeartEvent) {
      yield* _mapListHeartEvent(event);
    } else if(event is CreateHeartEvent) {
      yield* _mapCreateHeartEvent(event);
    } else if(event is DeleteHeartEvent) {
      yield* _mapDeleteHeartEvent(event);
    }
  }

  // stream 으로 정의해야 ui 에서 받을 수 있다.
  // repository 를 별도로 쓰지 않는 경우 stream builder 만으로도 bloc 패턴을 구현하는 경우가 있다
  Stream<HeartState> _mapListHeartEvent(ListHeartEvent event) async* {
    try {
      yield Loading();

      // 서버 통신 (repository) 연결;
      final response = await this.repository.listHeart();

      yield Loaded(response);

    } catch (e) {
      yield Error(e.message);
    }
  }

  Stream<HeartState> _mapCreateHeartEvent(CreateHeartEvent event) async* {
    try {
      // yield 된 모든 값은 state 로 가져올 수 있다
      if(state is Loaded) {
        final parsedState = (state as Loaded);

        final respHearts =  await repository.createHeart(parsedState.hearts ,event.item);

        yield Loaded(respHearts);

      }
    } catch (e) {
      yield Error(e.message);
    }
  }

  Stream<HeartState> _mapDeleteHeartEvent(DeleteHeartEvent event) async* {
    try {
      if(state is Loaded) {
        final parsedState = (state as Loaded);

        final respHearts = await repository.deleteHeart(parsedState.hearts, event.item);

        yield Loaded(respHearts);

      }
    } catch (e) {
      yield Error(e.message);
    }
  }
}