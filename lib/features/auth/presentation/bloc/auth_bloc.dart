import 'package:bloc/bloc.dart';
import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/core/functions/base_finctions.dart';
import 'package:chat_test/core/local_source/local_source.dart';
import 'package:chat_test/features/auth/domain/entity/auth_request_entity.dart';
import 'package:chat_test/features/auth/domain/usecacse/create_user_auth_use_case.dart';
import 'package:chat_test/features/auth/domain/usecacse/login_auth_use_case.dart';
import 'package:chat_test/injection_container.dart';
import 'package:chat_test/router/app_routes.dart';
import 'package:chat_test/router/name_routes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CreateUserAuthUseCase createUserAuthUseCase;
  final LoginAuthUseCase loginAuthUseCase;

  AuthBloc(
    this.createUserAuthUseCase,
    this.loginAuthUseCase,
  ) : super(const AuthState(isLoading: false, isEnable: false)) {
    on<CreateUserEvent>(_createUserCall);
    on<LoginEvent>(_loginCall);
    on<EnableSubmitButtonEvent>(_enviableSubmitButton);
  }

  Future<void> _createUserCall(
      CreateUserEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await createUserAuthUseCase(AuthRequestEntity(
      password: event.password,
      email: event.email,
    ));
    response.fold((l) {
      if (l is FirebaseError) {
        Functions.showAlertSnackBar(Functions.getError(l.code));
      }
      emit(state.copyWith(isLoading: false));
    }, (r) {
      sl<LocalSource>().setUserEmail(event.email);
      sl<LocalSource>().setUserPassword(event.password);
      Navigator.pushReplacementNamed(
          rootNavigatorKey.currentContext!, Routes.main);
      emit(state.copyWith(isLoading: false));
    });
  }

  Future<void> _loginCall(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await loginAuthUseCase(AuthRequestEntity(
      password: event.password,
      email: event.email,
    ));
    response.fold((l) {
      if (l is FirebaseError) {
        Functions.showAlertSnackBar(Functions.getError(l.code));
      }
      emit(state.copyWith(isLoading: false));
    }, (r) {
      sl<LocalSource>().setUserEmail(event.email);
      sl<LocalSource>().setUserPassword(event.password);
      Navigator.pushReplacementNamed(
          rootNavigatorKey.currentContext!, Routes.main);
      emit(state.copyWith(isLoading: false));
    });
  }

  void _enviableSubmitButton(
      EnableSubmitButtonEvent event, Emitter<AuthState> emit) {
    if (event.email.length > 6 &&
        RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
            .hasMatch(event.email) &&
        event.password.length > 6) {
      emit(state.copyWith(isEnable: true));
    } else {
      emit(state.copyWith(isEnable: false));
    }
  }
}
