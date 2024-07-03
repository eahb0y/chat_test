import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/core/usecase/usecase.dart';
import 'package:chat_test/features/search/domain/repository/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchUserUseCase extends UseCase<Set<String>, String> {
  final SearchRepository repository;

  SearchUserUseCase(this.repository);

  @override
  Future<Either<Failure, Set<String>>> call(String params) async {
    final result = await repository.searchUser(params);
    return result;
  }
}
