import 'package:bloc/bloc.dart';
import 'package:chat_test/core/functions/base_finctions.dart';
import 'package:chat_test/core/functions/image_upload.dart';
import 'package:chat_test/core/local_source/local_source.dart';
import 'package:chat_test/features/chat/data/model/create_chat_id_request.dart';
import 'package:chat_test/features/chat/data/model/send_massage_request.dart';
import 'package:chat_test/features/chat/domain/entity/conversation_massage_response_entity.dart';
import 'package:chat_test/features/chat/domain/usecase/create_chat_id_use_case.dart';
import 'package:chat_test/features/chat/domain/usecase/get_chat_id_use_case.dart';
import 'package:chat_test/features/chat/domain/usecase/get_conversation_use_case.dart';
import 'package:chat_test/features/chat/domain/usecase/send_massage_use_case.dart';
import 'package:chat_test/injection_container.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetChatIdUseCase getChatIdUseCase;
  final GetConversationUseCase getConversationUseCase;
  final SendMassageUseCase sendMassageUseCase;
  final CreateChatIdUseCase createChatIdUseCase;

  ChatBloc(
    this.getChatIdUseCase,
    this.getConversationUseCase,
    this.sendMassageUseCase,
    this.createChatIdUseCase,
  ) : super(const ChatState(
          isLoading: false,
          isStreamWork: false,
        )) {
    on<InitialCallEvent>(_getChatId);
    on<GetConversationCallEvent>(_conversationStream);
    on<SendMassageCallEvent>(_sendMassage);
    on<EmitConversationCallEvent>(emitConversationMassage);
    on<UploadImageEvent>(_uploadImage);
  }

  Future<void> _getChatId(
      InitialCallEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await getChatIdUseCase(event.user);
    response.fold((l) {}, (r) {
      if (r.isNotEmpty) {
        emit(state.copyWith(chatId: r));
        add(GetConversationCallEvent(conversation: r));
      } else {
        _createChatIdCall(event.user, emit);
      }
    });
  }

  Future<void> _conversationStream(
      GetConversationCallEvent event, Emitter<ChatState> emit) async {
    final response = await getConversationUseCase(state.chatId ?? "");
    response.fold((l) {}, (r) {
      add(EmitConversationCallEvent(response: r));
    });
  }

  void emitConversationMassage(
      EmitConversationCallEvent event, Emitter<ChatState> emit) {
    List<MassageEntity> setToList = event.response.massages.toList();
    setToList.sort((a, b){
      int aDate = DateTime.parse(a.massageData ?? '').microsecondsSinceEpoch;
      int bDate = DateTime.parse(b.massageData ?? '').microsecondsSinceEpoch;
      return aDate.compareTo(bDate);
    });
    setToList.toSet();
    emit(state.copyWith(
        isLoading: false, conversationMassageResponseEntity: setToList.toSet()));
  }

  Future<void> _sendMassage(
      SendMassageCallEvent event, Emitter<ChatState> emit) async {
    final result = await sendMassageUseCase(SendMassageRequest(
      massageSender: sl<LocalSource>().getUserEmail(),
      conversationId: event.conversationId ?? "",
      massage: event.massage,
      massageId: Functions.generateUniqueId(),
      massageData: DateTime.now().toString(),
    ));
    result.fold((l) {}, (r) {});
  }

  Future<void> _createChatIdCall(String user, Emitter<ChatState> emit) async {
    String chatId = Functions.generateUniqueId();
    final response = await createChatIdUseCase(CreateChatIdRequest(
      firstUser: sl<LocalSource>().getUserEmail(),
      secondUser: user,
      chatId: chatId,
    ));
    response.fold((l) {}, (r) {
      add(GetConversationCallEvent(conversation: chatId));
      emit(state.copyWith(chatId: chatId, isLoading: false));
    });
  }

  Future<void> _uploadImage(
      UploadImageEvent event, Emitter<ChatState> emit) async {
    if(event.image != null){
      await ImageUpload.uploadImage(
        img: event.image,
        conversationId: state.chatId ?? "",
        genId: Functions.generateUniqueId(),
      );
    }
  }
}
