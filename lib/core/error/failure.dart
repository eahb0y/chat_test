import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class FirebaseException extends Failure{
  final String code;

  FirebaseException({required this.code});
  @override
  List<Object?> get props => [code];
}

class ServerError extends Failure {
  final String message;

  ServerError({required this.message});

  @override
  List<Object?> get props => [message];
}

