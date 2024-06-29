part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isLoading;

  const AuthState({
    required this.isLoading,
  });

  AuthState copyWith({
    bool? isLoading,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
  ];
}
