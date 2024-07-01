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
// Future<void> _writeUserNameCall(
//     SetUserEvent event, Emitter<MainState> emit) async {
//   try {
//     await firestore
//         .collection("chats-ad_awim")
//         .add({"massage": event.userName, "mine-massage": true});
//   } catch (e) {
//     debugPrint(e.toString());
//   }
// }

// Future<void> _getUserChatCall(
//     GetUserChatEvent event, Emitter<MainState> emit) async {
//   try {
//     print("Starting stream listener...");
//     Stream stream =
//         Stream.periodic(const Duration(seconds: 2)).asBroadcastStream();
//     stream.listen((_) async {
//       await _getUserMassage();
//     });
//   } on FirebaseException catch (e) {
//     debugPrint(e.toString());
//   }
// }
//
// Future<void> _getUserMassage() async {
//   try {
//     Set<Items> massagesList = {};
//     var result = await firestore.collection("chats-ad_awim").get();
//     for (var doc in result.docs) {
//       massagesList.add(Items.fromJson(doc.data()));
//     }
//     add(ShowMessageEvent(items: massagesList));
//   } catch (e) {
//     debugPrint("Error fetching messages: $e");
//   }
// }
//
// void _showMessage(ShowMessageEvent event, Emitter<MainState> emit) {
//   emit(state.copyWith(massageList: event.items));
// }
}
