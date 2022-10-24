part of 'auth_bloc.dart';

final initialAuthState = AuthState(
  errorMessage: '',
  apiToken: '',
  isLoading: true,
);

@immutable
class AuthState {
  final String apiToken;
  final String errorMessage;
  final bool isLoading;

  AuthState({
    required this.apiToken,
    required this.errorMessage,
    required this.isLoading,
  });

  AuthState copyWith({
    String? apiToken,
    String? errorMessage,
    bool? isLoading,
  }) {
    return AuthState(
      apiToken: apiToken ?? this.apiToken,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
