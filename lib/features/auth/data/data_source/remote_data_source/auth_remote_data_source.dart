import 'package:chat_test/features/auth/data/model/new_user_auth_request_model.dart';
import 'package:chat_test/features/auth/domain/entity/create_user_cloud_request_entity.dart';

abstract class AuthRemoteDataSource {
  Future<void> createNewUser(NewUserAuthRequest request);

  Future<void> logInUser(NewUserAuthRequest request);

  Future<void> createUserOnCloud(CreateUserCloudRequest request);
}
