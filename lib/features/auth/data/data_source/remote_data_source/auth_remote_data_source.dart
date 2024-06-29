import 'package:chat_test/features/auth/data/model/new_user_auth_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> createNewUser(NewUserAuthRequest request);
  Future<void> logInUser(NewUserAuthRequest request);
}
