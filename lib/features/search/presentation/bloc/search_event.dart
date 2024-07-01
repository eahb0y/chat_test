part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchUserEvent extends SearchEvent{
  final String user;

  const SearchUserEvent({required this.user});
  @override
  List<Object?> get props => [user];
}
