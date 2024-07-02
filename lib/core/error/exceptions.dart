class ServerException implements Exception {
  final String? errorCode;

  ServerException({this.errorCode});

  factory ServerException.fromJson(String error) {
    return ServerException(
      errorCode: error,
    );
  }
}
