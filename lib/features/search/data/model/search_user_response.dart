import 'package:chat_test/core/local_source/local_source.dart';
import 'package:chat_test/features/main/domain/entity/chats_response_entity.dart';
import 'package:chat_test/injection_container.dart';

class SearchUserResponse {
  SearchUserResponse({
    this.chatId,
    this.firstUser,
    this.secondUser,
  });

  SearchUserResponse.fromJson(dynamic json) {
    chatId = json['chat_id'];
    firstUser = json['first_user'];
    secondUser = json['second_user'];
  }

  String? chatId;
  String? firstUser;
  String? secondUser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['chat_id'] = chatId;
    map['first_user'] = firstUser;
    map['second_user'] = secondUser;
    return map;
  }

  static ChatsResponseEntity toEntity(
    Set<SearchUserResponse> response,
    String user,
  ) {
    Set<ChatEntity> setOfChats = {};
    for (var item in response) {
      if (((item.firstUser?.contains(sl<LocalSource>().getUserEmail()) ??
                  false) ||
              (item.firstUser?.contains(user) ?? false)) ||
          ((item.secondUser?.contains(sl<LocalSource>().getUserEmail()) ??
                  false) ||
              ((item.secondUser?.contains(user) ?? false)))) {
        setOfChats.add(ChatEntity(
          chatId: item.chatId,
          recipient:
              (item.firstUser ?? "") == user ? item.secondUser : item.firstUser,
        ));
      }
    }
    return ChatsResponseEntity(
      setOfChats: setOfChats,
    );
  }
}
