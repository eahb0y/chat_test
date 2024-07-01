import 'package:chat_test/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<Failure, Set<String>>> searchUser(String user);
}
