import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/core/usecase/usecase.dart';
import 'package:chat_test/features/chat/data/model/create_chat_id_request.dart';
import 'package:chat_test/features/chat/data/model/send_massage_request.dart';
import 'package:chat_test/features/chat/domain/entity/conversation_massage_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepository {
  Future<Either<Failure, String>> getConversationId(String user);

  Future<Either<Failure, ConversationMassageResponseEntity>> getConversation(
      String conversationId);

  Future<Either<Failure, NoParams>> sendMassage(SendMassageRequest request);

  Future<Either<Failure, NoParams>> createChatId(CreateChatIdRequest request);
}
