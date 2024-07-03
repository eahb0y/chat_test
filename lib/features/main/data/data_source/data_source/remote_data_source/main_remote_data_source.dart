
import 'package:chat_test/features/main/data/model/chats_response.dart';

abstract class MainRemoteDataSource {
  Future<Set<ChatsResponse>> getChats();
}
