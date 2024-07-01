import 'package:chat_test/constants/constants.dart';
import 'package:chat_test/core/error/exceptions.dart';
import 'package:chat_test/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:chat_test/features/auth/data/model/new_user_auth_request_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<void> createNewUser(NewUserAuthRequest request) async {
    try {
      await FirebaseInstance.authFireBase.createUserWithEmailAndPassword(
        email: request.email ?? "",
        password: request.password ?? "",
      );
    } on FirebaseAuthException catch (e) {
      throw ServerException.fromJson(e.code);
    } on FormatException {
      throw ServerException(errorCode: Validations.someThingWentWrong);
    }
  }

  @override
  Future<void> logInUser(NewUserAuthRequest request) async {
    try {
      await FirebaseInstance.authFireBase.signInWithEmailAndPassword(
        email: request.email ?? "",
        password: request.password ?? "",
      );
    } on FirebaseAuthException catch (e) {
      throw ServerException.fromJson(e.code);
    } on FormatException {
      throw ServerException(errorCode: Validations.someThingWentWrong);
    }
  }
}
