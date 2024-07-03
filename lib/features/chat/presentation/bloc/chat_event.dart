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
  final String? date;

  const SendMassageCallEvent({
    required this.massage,
    required this.conversationId,
    required this.date,
  });

  @override
  List<Object?> get props => [
        massage,
        conversationId,
        date,
      ];
}

class UploadImageEvent extends ChatEvent{
  final XFile? image;

  const UploadImageEvent({required this.image});
  @override
  List<Object?> get props => [image];
}
