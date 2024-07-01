import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/core/usecase/usecase.dart';
import 'package:chat_test/features/chat/data/model/send_massage_request.dart';
import 'package:chat_test/features/chat/domain/repository/chat_repository.dart';
import 'package:dartz/dartz.dart';

class SendMassageUseCase extends UseCase<NoParams, SendMassageRequest> {
  final ChatRepository repository;

  SendMassageUseCase(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(SendMassageRequest params) async {
    final result = await repository.sendMassage(params);
    return result;
  }
}
