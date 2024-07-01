import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/core/usecase/usecase.dart';
import 'package:chat_test/features/chat/domain/repository/chat_repository.dart';
import 'package:dartz/dartz.dart';

class GetChatIdUseCase extends UseCase<String, String> {
  final ChatRepository repository;

  GetChatIdUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(String params) async {
    final result = await repository.getConversationId(params);
    return result;
  }
}
