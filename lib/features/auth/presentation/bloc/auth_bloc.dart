import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tic_tac_toe/features/auth/domain/usecases/login_email_password.dart';
import 'package:tic_tac_toe/features/auth/domain/usecases/register_email_password.dart';

import '../../domain/entities/user_entity.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginEmailPassword _loginEmailPassword;
  final RegisterEmailPassword _registerEmailPassword;

  AuthBloc({
    required LoginEmailPassword loginEmailPassword,
    required RegisterEmailPassword registerEmailPassword,
  })  : _loginEmailPassword = loginEmailPassword,
        _registerEmailPassword = registerEmailPassword,
        super(AuthInitial()) {
    on<EmailPasswordLoginEvent>(_onEmailPasswordLogin);
    on<EmailPasswordRegisterEvent>(_onEmailPasswordRegister);
  }

  Future<void> _onEmailPasswordLogin(
    EmailPasswordLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await _loginEmailPassword.call(event.email, event.password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onEmailPasswordRegister(
    EmailPasswordRegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await _registerEmailPassword.call(
        event.name,
        event.email,
        event.password,
      );
      print(user);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
