import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/features/search/data/data_source/remote_data_source/search_remote_data_source.dart';
import 'package:chat_test/features/search/domain/repository/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl extends SearchRepository{
  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, Set<String>>> searchUser(String user) async {
    try {
      final response = await remoteDataSource.searchUser(user);
      return Right(response);
    } catch (e) {
      return Left(ServerError(
        message: e is ServerError ? e.message : e.toString(),
      ));
    }
  }
}