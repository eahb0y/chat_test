import 'package:chat_test/features/chat/domain/entity/conversation_massage_response_entity.dart';

class GetConversationResponse {
  GetConversationResponse({
    this.massage,
    this.massageData,
    this.massageId,
    this.massageSender,
  });

  GetConversationResponse.fromJson(dynamic json) {
    massage = json['massage'];
    massageData = json['massage_data'];
    massageId = json['massage_id'];
    massageSender = json['massage_sender'];
  }

  String? massage;
  String? massageData;
  String? massageId;
  String? massageSender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['massage'] = massage;
    map['massage_data'] = massageData;
    map['massage_id'] = massageId;
    map['massage_sender'] = massageSender;
    return map;
  }

  static ConversationMassageResponseEntity toEntity(
      Set<GetConversationResponse> response) {
    Set<MassageEntity> massages = {};
    for (var value in response) {
      massages.add(MassageEntity(
        massage: value.massage,
        massageData: value.massageData,
        massageId: value.massageId,
        massageSender: value.massageSender,
      ));
    }
    return ConversationMassageResponseEntity(
      massages: massages,
    );
  }
}
