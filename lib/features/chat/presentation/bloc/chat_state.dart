part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final bool isLoading;
  final Set<MassageEntity>? conversationMassageResponseEntity;
  final String? chatId;
  final bool isStreamWork;

  const ChatState({
    required this.isLoading,
    this.conversationMassageResponseEntity,
    this.chatId,
    required this.isStreamWork,
  });

  ChatState copyWith({
    bool? isLoading,
    Set<MassageEntity>? conversationMassageResponseEntity,
    String? chatId,
    bool? isStreamWork,
  }) {
    return ChatState(
      isLoading: isLoading ?? this.isLoading,
      conversationMassageResponseEntity: conversationMassageResponseEntity ??
          this.conversationMassageResponseEntity,
      chatId: chatId ?? this.chatId,
      isStreamWork: isStreamWork ?? this.isStreamWork,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        conversationMassageResponseEntity,
        chatId,
        isStreamWork,
      ];
}
