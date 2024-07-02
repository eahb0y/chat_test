import 'package:chat_test/core/error/failure.dart';
import 'package:chat_test/core/functions/base_finctions.dart';
import 'package:chat_test/core/usecase/usecase.dart';
import 'package:chat_test/features/main/domain/entity/chats_response_entity.dart';
import 'package:chat_test/features/main/domain/usecase/get_chats_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final GetChatsUseCase getChatsUseCase;

  MainBloc(this.getChatsUseCase) : super(const MainState(isLoading: false)) {
    on<GetAllChatsEvent>(_getAllChat);
    on<OnStreamCallEvent>(_getChatsOnStream);
  }

  Future<void> _getAllChat(
      GetAllChatsEvent event, Emitter<MainState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await getChatsUseCase(const NoParams());
    response.fold((l) {
      if (l is FirebaseError) {
        Functions.showAlertSnackBar(l.code);
      }
      emit(state.copyWith(isLoading: false));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        massagesList: r,
      ));
    });
  }

  Future<void> _getChatsOnStream(
      OnStreamCallEvent event, Emitter<MainState> emit) async {
    final response = await getChatsUseCase(const NoParams());
    response.fold((l) {
      // if (l is FirebaseError) {
      //   Functions.showAlertSnackBar(l.code);
      // }
    }, (r) {
      emit(state.copyWith(
        massagesList: r,
      ));
    });
  }
}
