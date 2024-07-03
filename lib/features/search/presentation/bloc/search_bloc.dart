import 'package:bloc/bloc.dart';
import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/core/functions/base_finctions.dart';
import 'package:chat_test/features/search/domain/usecase/search_user_use_case.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUserUseCase searchUserUseCase;
  SearchBloc(this.searchUserUseCase) : super(const SearchState(isLoading: false)) {
    on<SearchUserEvent>(_searchUserCall);
  }

  Future<void> _searchUserCall(SearchUserEvent event,
      Emitter<SearchState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await searchUserUseCase(event.user);
    response.fold((l) {
      if (l is FirebaseError) {
        Functions.showAlertSnackBar(l.code);
      }
      emit(state.copyWith(isLoading: false));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        userList: r,
      ));
    });
  }
}
