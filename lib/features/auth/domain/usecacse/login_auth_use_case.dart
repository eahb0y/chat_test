import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/core/usecase/usecase.dart';
import 'package:chat_test/features/auth/domain/entity/auth_request_entity.dart';
import 'package:chat_test/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginAuthUseCase extends UseCase<NoParams, AuthRequestEntity> {
  final AuthRepository repository;

  LoginAuthUseCase(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(AuthRequestEntity params) async {
    final result = await repository.logIn(params);
    return result;
  }
}
