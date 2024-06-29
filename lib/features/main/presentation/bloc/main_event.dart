part of 'main_bloc.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();
}

class SetUserEvent extends MainEvent {
  final String userName;

  const SetUserEvent({required this.userName});

  @override
  List<Object?> get props => [userName];
}

class GetUserChatEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}

class ShowMessageEvent extends MainEvent {
  final Set<Items> items;

  const ShowMessageEvent({required this.items});
  @override
  List<Object?> get props => [items];
}
