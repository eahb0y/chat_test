import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/core/usecase/usecase.dart';
import 'package:chat_test/features/auth/domain/entity/auth_request_entity.dart';
import 'package:dartz/dartz.dart';


abstract class AuthRepository {
  Future<Either<Failure, NoParams>> logIn(AuthRequestEntity request);

  Future<Either<Failure, NoParams>> createUser(AuthRequestEntity request);
}
