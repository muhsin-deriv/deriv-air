part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class TryLogin extends AuthEvent {
  final String token;

  TryLogin(this.token);
}

class TryLoginWithSavedToken extends AuthEvent {}
