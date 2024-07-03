import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/features/main/domain/entity/chats_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MainRepository{
  Future<Either<Failure, ChatsResponseEntity>> getChats();
}