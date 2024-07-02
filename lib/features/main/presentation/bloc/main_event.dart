part of 'main_bloc.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();
}

class GetAllChatsEvent extends MainEvent {
  const GetAllChatsEvent();
  @override
  List<Object?> get props => [];
}

class SearchUserEvent extends MainEvent {
  final String user;

  const SearchUserEvent({required this.user});
  @override
  List<Object?> get props => [user];
}

class OnStreamCallEvent extends MainEvent {
  const OnStreamCallEvent();

  @override
  List<Object?> get props => [];
}