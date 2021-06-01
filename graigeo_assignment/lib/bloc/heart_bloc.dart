import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graigeo_assignment/bloc/heart_event.dart';
import 'package:graigeo_assignment/bloc/heart_state.dart';
import 'package:graigeo_assignment/repository/heartRepository.dart';

class HeartBloc extends Bloc<HeartEvent, HeartState> {
  final HeartRepository repository;

  HeartBloc(this.repository): super(Empty());

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

  Stream<HeartState> _mapListHeartEvent(ListHeartEvent event) async* {
    try {
      yield Loading();

      final response = await this.repository.listHeart();

      final hearts = response;

      yield Loaded(hearts);

    } catch (e) {
      yield Error(e.message);
    }
  }

  Stream<HeartState> _mapCreateHeartEvent(CreateHeartEvent event) async* {
    try {
      if(state is Loaded) {
        final parsedState = (state as Loaded);

        final newHeart = event.item;

        final prevHearts = [...parsedState.hearts];
        final newHearts = [...prevHearts, newHeart];

        yield Loaded(newHearts);
      }
    } catch (e) {
      yield Error(e.message);
    }
  }

  Stream<HeartState> _mapDeleteHeartEvent(DeleteHeartEvent event) async* {
    try {
      if(state is Loaded) {
        final newHearts = (state as Loaded)
            .hearts
            .where((heart) => heart != event.item)
            .toList();

        yield Loaded(newHearts);

        await repository.deleteHeart(event.item);
      }
    } catch (e) {
      yield Error(e.message);
    }
  }
}