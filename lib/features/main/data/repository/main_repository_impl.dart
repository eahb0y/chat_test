import 'package:chat_test/core/error/exceptions.dart';
import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/features/main/data/data_source/data_source/remote_data_source/main_remote_data_source.dart';
import 'package:chat_test/features/main/data/model/chats_response.dart';
import 'package:chat_test/features/main/domain/entity/chats_response_entity.dart';
import 'package:chat_test/features/main/domain/repository/main_repository.dart';
import 'package:dartz/dartz.dart';

class MainRepositoryImpl extends MainRepository {
  final MainRemoteDataSource remoteDataSource;

  MainRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ChatsResponseEntity>> getChats() async {
    try {
      final response = await remoteDataSource.getChats();
      return Right(ChatsResponse.toEntity(response));
    } catch (e) {
      return Left(FirebaseError(
        code: e is ServerException ? (e.errorCode ?? "") : e.toString(),
      ));
    }
  }
}
