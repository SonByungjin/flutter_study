import 'package:bitinsider_structure/bloc/auth/auth_event.dart';
import 'package:bitinsider_structure/bloc/auth/auth_state.dart';
import 'package:bitinsider_structure/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final AuthRepository repository;

  AuthBloc(this.repository): super(Loading());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if(event is SendAuth) {
      try {
        yield Loading();

        final response = await this.repository.receiveAuth();

        yield Loaded(response);

      } catch (e) {
        yield Error(e.message);
      }
    }
  }

}