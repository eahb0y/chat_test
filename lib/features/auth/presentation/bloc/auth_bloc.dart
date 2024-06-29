import 'package:bloc/bloc.dart';
import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/core/functions/base_finctions.dart';
import 'package:chat_test/features/auth/domain/entity/auth_request_entity.dart';
import 'package:chat_test/features/auth/domain/usecacse/create_user_auth_use_case.dart';
import 'package:chat_test/features/auth/domain/usecacse/login_auth_use_case.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CreateUserAuthUseCase createUserAuthUseCase;
  final LoginAuthUseCase loginAuthUseCase;

  AuthBloc(
    this.createUserAuthUseCase,
    this.loginAuthUseCase,
  ) : super(const AuthState(
          isLoading: false,
        )) {
    on<CreateUserEvent>(_createUserCall);
  }

  Future<void> _createUserCall(
      CreateUserEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await createUserAuthUseCase(AuthRequestEntity(
      password: event.password,
      email: event.email,
    ));
    response.fold((l) {
      if (l is FirebaseException) {
        Functions.showAlertSnackBar(l.code);
      }
      emit(state.copyWith(isLoading: false));
    }, (r) {
      emit(state.copyWith(isLoading: false));
    });
  }
}
