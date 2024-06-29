import 'package:chat_test/core/model/error_response.dart';

class ServerException implements Exception {
  final String? errorCode;

  ServerException({this.errorCode});

  factory ServerException.fromJson(String errorCode) {
    return ServerException(
      errorCode: errorCode,
    );
  }
}
