import 'package:chat_test/features/chat/data/model/create_chat_id_request.dart';
import 'package:chat_test/features/chat/data/model/get_conversatioon_response.dart';
import 'package:chat_test/features/chat/data/model/send_massage_request.dart';

abstract class ChatRemoteDataSource {
  Future<String> getUserChatId(String user);

  Future<Set<GetConversationResponse>> getConversation(String conversationId);

  Future<void> sendMassage(SendMassageRequest request);

  Future<void> createConversationId(CreateChatIdRequest request);
}
