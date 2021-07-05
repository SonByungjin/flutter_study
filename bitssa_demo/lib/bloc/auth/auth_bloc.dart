import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bitssa_demo/bloc/auth/auth_event.dart';
import 'package:bitssa_demo/bloc/auth/auth_state.dart';
import '../../repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final AuthRepository repository;

  AuthBloc(this.repository): super(Loading());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if(event is LogCheck) {
      try {
        yield Loading();

        final response = await this.repository.currentUser();

        yield Loaded(response);

      } catch (e) {
        yield Error(e.message);
      }
    } else if (event is LogIn) {
      try {
        yield Loading();

        final rsp = await this.repository.resisterUser(event.id, event.pw);

        yield Loaded(rsp);
      } catch (e) {
        yield Error(e.message);
      }
    } else if (event is LogOut) {
      try {
        yield Loading();

        final rsp = await this.repository.removeUser();
        
        yield Loaded(rsp);
      } catch (e) {
        yield Error(e.message);
      }
    }
  }
}
