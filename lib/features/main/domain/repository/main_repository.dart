import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/features/main/data/model/search_user_response.dart';
import 'package:chat_test/features/main/domain/entity/chats_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MainRepository{
  Future<Either<Failure, ChatsResponseEntity>> getChats();

  Future<Either<Failure, Set<String>>> searchUser(String user);


}