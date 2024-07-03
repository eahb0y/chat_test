import 'package:chat_test/core/error/exceptions.dart';
import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/core/usecase/usecase.dart';
import 'package:chat_test/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:chat_test/features/auth/data/model/new_user_auth_request_model.dart';
import 'package:chat_test/features/auth/domain/entity/auth_request_entity.dart';
import 'package:chat_test/features/auth/domain/entity/create_user_cloud_request_entity.dart';
import 'package:chat_test/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, NoParams>> logIn(AuthRequestEntity request) async {
    try {
      await remoteDataSource.logInUser(NewUserAuthRequest(
        email: request.email,
        password: request.password,
      ));
      return const Right(NoParams());
    } catch (e) {
      return Left(FirebaseError(
        code: e is ServerException ? (e.errorCode ?? "") : e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, NoParams>> createUser(
      AuthRequestEntity request) async {
    try {
      await remoteDataSource.createNewUser(NewUserAuthRequest(
        email: request.email,
        password: request.password,
      ));
      return const Right(NoParams());
    } catch (e) {
      return Left(FirebaseError(
        code: e is ServerException ? (e.errorCode ?? "") : e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, NoParams>> createUserCloud(
      CreateUserCloudRequest request) async {
    try {
      await remoteDataSource.createUserOnCloud(request);
      return const Right(NoParams());
    } catch (e) {
      return Left(FirebaseError(
        code: e is ServerException ? (e.errorCode ?? "") : e.toString(),
      ));
    }
  }
}
