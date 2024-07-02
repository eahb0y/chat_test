part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();
}

class InitialCallEvent extends ChatEvent {
  final String user;

  const InitialCallEvent({required this.user});

  @override
  List<Object?> get props => [user];
}

class GetConversationCallEvent extends ChatEvent {
  final String conversation;

  const GetConversationCallEvent({required this.conversation});

  @override
  List<Object?> get props => [conversation];
}

class EmitConversationCallEvent extends ChatEvent {
  final ConversationMassageResponseEntity response;

  const EmitConversationCallEvent({
    required this.response,
  });

  @override
  List<Object?> get props => [response];
}

class SendMassageCallEvent extends ChatEvent {
  final String? massage;
  final String? conversationId;

  const SendMassageCallEvent({
    required this.massage,
    required this.conversationId,
  });

  @override
  List<Object?> get props => [
        massage,
        conversationId,
      ];
}

class UploadImageEvent extends ChatEvent{
  final String image;

  const UploadImageEvent({required this.image});
  @override
  List<Object?> get props => [];
}
