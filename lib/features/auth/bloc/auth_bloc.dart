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
      if (event is TryLogin) {
        emit(state.copyWith(apiToken: event.token));
        try {
          await authRepo.checkAPIToken(event.token);
          MyApp.replaceToHome();
        } on ApiError catch (e) {
          emit(state.copyWith(errorMessage: e.message));
        }
      }
    });
  }
}
