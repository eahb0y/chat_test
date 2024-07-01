part of 'main_bloc.dart';

class MainState extends Equatable {
  final ChatsResponseEntity? massagesList;
  final bool isLoading;
  const MainState({
    this.massagesList,
    required this.isLoading,
  });

  MainState copyWith({
    ChatsResponseEntity? massagesList,
    bool? isLoading,
  }) {
    return MainState(
      isLoading: isLoading ?? this.isLoading,
      massagesList: massagesList ?? this.massagesList,
    );
  }

  @override
  List<Object?> get props => [
        massagesList,
        isLoading,
      ];
}
