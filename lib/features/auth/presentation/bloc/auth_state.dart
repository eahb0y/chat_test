part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final bool isEnable;

  const AuthState({
    required this.isLoading, required this.isEnable});

  AuthState copyWith({
    bool? isLoading,
    bool? isEnable,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isEnable: isEnable ?? this.isEnable,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
        isEnable,
      ];
}
