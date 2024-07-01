import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/core/usecase/usecase.dart';
import 'package:chat_test/features/chat/data/model/create_chat_id_request.dart';
import 'package:chat_test/features/chat/domain/repository/chat_repository.dart';
import 'package:dartz/dartz.dart';

class CreateChatIdUseCase extends UseCase<NoParams, CreateChatIdRequest> {
  final ChatRepository repository;

  CreateChatIdUseCase(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(CreateChatIdRequest params) async {
    final result = await repository.createChatId(params);
    return result;
  }
}
