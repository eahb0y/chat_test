part of 'search_bloc.dart';

class SearchState extends Equatable {
  final bool isLoading;
  final Set<String>? userList;

  const SearchState({
    required this.isLoading,
    this.userList,
  });

  SearchState copyWith({
    bool? isLoading,
    Set<String>? userList,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      userList: userList ?? this.userList,
    );
  }

  @override
  List<Object?> get props => [isLoading, userList];
}
