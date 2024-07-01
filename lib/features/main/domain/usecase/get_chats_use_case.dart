import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/core/usecase/usecase.dart';
import 'package:chat_test/features/main/domain/entity/chats_response_entity.dart';
import 'package:chat_test/features/main/domain/repository/main_repository.dart';
import 'package:dartz/dartz.dart';

class GetChatsUseCase extends UseCase<ChatsResponseEntity, NoParams> {
  final MainRepository mainRepository;

  GetChatsUseCase(this.mainRepository);

  @override
  Future<Either<Failure, ChatsResponseEntity>> call(NoParams params) async {
    final result = await mainRepository.getChats();
    return result;
  }
}
