part of 'auth_bloc.dart';

final initialAuthState = AuthState(
  errorMessage: '',
  apiToken: '',
);

@immutable
class AuthState {
  final String apiToken;
  final String errorMessage;

  AuthState({
    required this.apiToken,
    required this.errorMessage,
  });

  AuthState copyWith({
    String? apiToken,
    String? errorMessage,
  }) {
    return AuthState(
      apiToken: apiToken ?? this.apiToken,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
