class CreateChatIdRequest {
  CreateChatIdRequest({
      this.chatId, 
      this.firstUser, 
      this.secondUser,});

  CreateChatIdRequest.fromJson(dynamic json) {
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

}