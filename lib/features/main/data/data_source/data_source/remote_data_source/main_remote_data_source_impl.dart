import 'package:chat_test/constants/constants.dart';
import 'package:chat_test/core/error/exceptions.dart';
import 'package:chat_test/features/main/data/data_source/data_source/remote_data_source/main_remote_data_source.dart';
import 'package:chat_test/features/main/data/model/chats_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  @override
  Future<Set<ChatsResponse>> getChats() async {
    Set<ChatsResponse> setOfChats = {};
    try {
      final response = await FirebaseInstance.cloudFireBase
          .collection(FireBaseCollection.chatsBaseCollection)
          .get();
      if (response.docs.isNotEmpty) {
        for (var value in response.docs) {
          setOfChats.add(ChatsResponse.fromJson(value.data()));
        }
      }
      return setOfChats;
    } on FirebaseAuthException catch (e) {
      throw ServerException.fromJson(e.code);
    } on FormatException {
      throw ServerException(errorCode: Validations.someThingWentWrong);
    }
  }

  @override
  Future<String> setTime(String time) {
    // TODO: implement setTime
    throw UnimplementedError();
  }
}
