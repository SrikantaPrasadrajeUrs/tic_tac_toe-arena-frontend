part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

final class EmailPasswordLoginEvent extends AuthEvent {
  final String email;
  final String password;
  const EmailPasswordLoginEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

final class EmailPasswordRegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  const EmailPasswordRegisterEvent({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, password];
}
