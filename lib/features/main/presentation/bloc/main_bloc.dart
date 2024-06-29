import 'package:chat_test/features/main/data/model/chat_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<SetUserEvent>(_writeUserNameCall);
    on<GetUserChatEvent>(_getUserChatCall);
    on<ShowMessageEvent>(_showMessage);
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> _writeUserNameCall(
      SetUserEvent event, Emitter<MainState> emit) async {
    try {
      await firestore
          .collection("chats-ad_awim")
          .add({"massage": event.userName, "mine-massage": true});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _getUserChatCall(
      GetUserChatEvent event, Emitter<MainState> emit) async {
    try {
      print("Starting stream listener...");
      Stream stream =
          Stream.periodic(const Duration(seconds: 2)).asBroadcastStream();
      stream.listen((_) async {
        await _getUserMassage();
      });
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _getUserMassage() async {
    try {
      Set<Items> massagesList = {};
      var result = await firestore.collection("chats-ad_awim").get();
      for (var doc in result.docs) {
        massagesList.add(Items.fromJson(doc.data()));
      }
      add(ShowMessageEvent(items: massagesList));
    } catch (e) {
      debugPrint("Error fetching messages: $e");
    }
  }

  void _showMessage(ShowMessageEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(massageList: event.items));
  }
}
