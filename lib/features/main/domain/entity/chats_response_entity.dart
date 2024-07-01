class ChatsResponseEntity {
  final Set<ChatEntity>? setOfChats;

  ChatsResponseEntity({required this.setOfChats});
}

  class ChatEntity {
  final String? chatId;
  final String? recipient;

  ChatEntity({
    required this.chatId,
    required this.recipient,
  });
}
