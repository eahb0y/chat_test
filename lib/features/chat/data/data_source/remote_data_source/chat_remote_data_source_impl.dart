import 'package:chat_test/constants/constants.dart';
import 'package:chat_test/core/error/exceptions.dart';
import 'package:chat_test/core/local_source/local_source.dart';
import 'package:chat_test/features/chat/data/data_source/remote_data_source/chat_remote_data_source.dart';
import 'package:chat_test/features/chat/data/model/create_chat_id_request.dart';
import 'package:chat_test/features/chat/data/model/get_conversatioon_response.dart';
import 'package:chat_test/features/chat/data/model/send_massage_request.dart';
import 'package:chat_test/injection_container.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatRemoteDataSourceImpl extends ChatRemoteDataSource {
  @override
  Future<String> getUserChatId(String user) async {
    try {
      final response = await FirebaseInstance.cloudFireBase
          .collection(FireBaseCollection.chatsBaseCollection)
          .get();
      if (response.docs.isNotEmpty) {
        for (var value in response.docs) {
          if (value.data().containsValue(user) &&
              value.data().containsValue(sl<LocalSource>().getUserEmail())) {
            return value.data()["chat_id"];
          }
        }
      }
      return "";
    } on FirebaseAuthException catch (e) {
      throw ServerException.fromJson(e.code);
    } on FormatException {
      throw ServerException(errorCode: Validations.someThingWentWrong);
    }
  }

  @override
  Future<Set<GetConversationResponse>> getConversation(
      String conversationId) async {
    Set<GetConversationResponse> setOfMassages = {};
    try {
      final response = await FirebaseInstance.cloudFireBase
          .collection(FireBaseCollection.conversationBaseCollection)
          .doc("conversation_$conversationId")
          .collection(conversationId)
          .get();
      if (response.docs.isNotEmpty) {
        for (var value in response.docs) {
          setOfMassages.add(GetConversationResponse.fromJson(value.data()));
        }
      }
      return setOfMassages;
    } on FirebaseAuthException catch (e) {
      throw ServerException.fromJson(e.code);
    } on FormatException {
      throw ServerException(errorCode: Validations.someThingWentWrong);
    }
  }

  @override
  Future<void> sendMassage(SendMassageRequest request) async {
    try {
      await FirebaseInstance.cloudFireBase
          .collection(FireBaseCollection.conversationBaseCollection)
          .doc("conversation_${request.conversationId}")
          .collection(request.conversationId)
          .add(request.toJson());
    } on FirebaseAuthException catch (e) {
      throw ServerException.fromJson(e.code);
    } on FormatException {
      throw ServerException(errorCode: Validations.someThingWentWrong);
    }
  }

  @override
  Future<void> createConversationId(CreateChatIdRequest request) async {
    try {
      await FirebaseInstance.cloudFireBase
          .collection(FireBaseCollection.chatsBaseCollection)
          .add(request.toJson());
    } on FirebaseAuthException catch (e) {
      throw ServerException.fromJson(e.code);
    } on FormatException {
      throw ServerException(errorCode: Validations.someThingWentWrong);
    }
  }
}
