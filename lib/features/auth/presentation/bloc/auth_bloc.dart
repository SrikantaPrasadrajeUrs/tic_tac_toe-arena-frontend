import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user_entity.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<EmailPasswordLoginEvent>(emailPasswordLogin);
  }

  Future<void> emailPasswordLogin(EmailPasswordLoginEvent event, Emitter<AuthState> emit)async{

  }
}
