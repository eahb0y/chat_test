
import 'package:chat_test/features/main/data/model/chats_response.dart';
import 'package:chat_test/features/main/data/model/search_user_response.dart';

abstract class MainRemoteDataSource {
  Future<Set<ChatsResponse>> getChats();

  Future<Set<String>> searchUser();
}
