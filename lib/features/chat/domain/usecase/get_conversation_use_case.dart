import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/core/usecase/usecase.dart';
import 'package:chat_test/features/chat/domain/entity/conversation_massage_response_entity.dart';
import 'package:chat_test/features/chat/domain/repository/chat_repository.dart';
import 'package:dartz/dartz.dart';

class GetConversationUseCase
    extends UseCase<ConversationMassageResponseEntity, String> {
  final ChatRepository repository;

  GetConversationUseCase(this.repository);

  @override
  Future<Either<Failure, ConversationMassageResponseEntity>> call(
      String params) async {
    final result = await repository.getConversation(params);
    return result;
  }
}
