part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
}

final class AuthenticatedState extends AuthState{
  final UserEntity userEntity;
  const AuthenticatedState(this.userEntity);
  @override
  List<Object> get props => [userEntity];
}

final class AuthFailure extends AuthState{
  final String message;
  const AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}
