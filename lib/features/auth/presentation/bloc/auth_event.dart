part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class EmailPasswordLoginEvent extends AuthEvent{
  const EmailPasswordLoginEvent(final String email, final String password);
}