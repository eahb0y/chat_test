import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/core/usecase/usecase.dart';
import 'package:chat_test/features/chat/data/data_source/remote_data_source/chat_remote_data_source.dart';
import 'package:chat_test/features/chat/data/model/create_chat_id_request.dart';
import 'package:chat_test/features/chat/data/model/get_conversatioon_response.dart';
import 'package:chat_test/features/chat/data/model/send_massage_request.dart';
import 'package:chat_test/features/chat/domain/entity/conversation_massage_response_entity.dart';
import 'package:chat_test/features/chat/domain/repository/chat_repository.dart';
import 'package:dartz/dartz.dart';

class ChatRepositoryImpl extends ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> getConversationId(String user) async {
    try {
      final response = await remoteDataSource.getUserChatId(user);
      return Right(response);
    } catch (e) {
      return Left(ServerError(
        message: e is ServerError ? e.message : e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, ConversationMassageResponseEntity>> getConversation(
      String conversationId) async {
    try {
      final response = await remoteDataSource.getConversation(conversationId);
      return Right(GetConversationResponse.toEntity(response));
    } catch (e) {
      return Left(ServerError(
        message: e is ServerError ? e.message : e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, NoParams>> sendMassage(
      SendMassageRequest request) async {
    try {
      await remoteDataSource.sendMassage(request);
      return const Right(NoParams());
    } catch (e) {
      return Left(ServerError(
        message: e is ServerError ? e.message : e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, NoParams>> createChatId(
      CreateChatIdRequest request) async {
    try {
      await remoteDataSource.createConversationId(request);
      return const Right(NoParams());
    } catch (e) {
      return Left(ServerError(
        message: e is ServerError ? e.message : e.toString(),
      ));
    }
  }
}
