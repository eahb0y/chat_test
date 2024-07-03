import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/core/usecase/usecase.dart';
import 'package:chat_test/features/auth/domain/entity/create_user_cloud_request_entity.dart';
import 'package:chat_test/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class CreateUserOnCloudUseCase
    extends UseCase<NoParams, CreateUserCloudRequest> {
  final AuthRepository repository;

  CreateUserOnCloudUseCase(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(CreateUserCloudRequest params) async {
    final result = await repository.createUserCloud(params);
    return result;
  }
}
