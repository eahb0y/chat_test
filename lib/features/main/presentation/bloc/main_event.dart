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

// class SetUserEvent extends MainEvent {
//   final String userName;
//
//   const SetUserEvent({required this.userName});
//
//   @override
//   List<Object?> get props => [userName];
// }
//
// class GetUserChatEvent extends MainEvent {
//   @override
//   List<Object?> get props => [];
// }
//
// class ShowMessageEvent extends MainEvent {
//   final Set<Items> items;
//
//   const ShowMessageEvent({required this.items});
//   @override
//   List<Object?> get props => [items];
// }
