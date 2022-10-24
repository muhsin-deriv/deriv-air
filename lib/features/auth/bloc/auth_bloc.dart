import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:price_tracker/common/exceptions/api_exceptions.dart';
import 'package:price_tracker/common/repository/auth_repo.dart';
import 'package:price_tracker/main.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo = AuthRepo();

  AuthBloc() : super(initialAuthState) {
    on<AuthEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      if (event is TryLoginWithSavedToken) {
        final tokenFromStorage = await authRepo.getTokenFromStorage();
        if (tokenFromStorage == null) {
          emit(state.copyWith(isLoading: false));
          return;
        }

        await authenticateWithToken(tokenFromStorage, emit);
      }

      if (event is TryLogin) {
        await authenticateWithToken(event.token, emit);
      }
    });
  }

  Future<void> authenticateWithToken(
    String token,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(apiToken: token));
    try {
      await authRepo.checkAPIToken(token);
      authRepo.saveTokenToStorage(token);
      MyApp.replaceToHome();
    } on ApiError catch (e) {
      emit(state.copyWith(errorMessage: e.message, isLoading: false));
    }
  }
}
