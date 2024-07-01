import 'package:chat_test/constants/constants.dart';
import 'package:chat_test/core/error/exceptions.dart';
import 'package:chat_test/features/search/data/data_source/remote_data_source/search_remote_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  @override
  Future<Set<String>> searchUser(String user) async {
    Set<String> setOfChats = {};
    try {
      final response = await FirebaseInstance.cloudFireBase
          .collection(FireBaseCollection.usersBaseCollection)
          .get();
      if (response.docs.isNotEmpty) {
        for (var value in response.docs) {
          if(value.reference.id.contains(user)){
            setOfChats.add(value.reference.id);
          }
        }
      }
      return setOfChats;
    } on FirebaseAuthException catch (e) {
      throw ServerException.fromJson(e.code);
    } on FormatException {
      throw ServerException(errorCode: Validations.someThingWentWrong);
    }
  }
}
