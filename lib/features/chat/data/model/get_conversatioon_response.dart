import 'package:chat_test/features/chat/domain/entity/conversation_massage_response_entity.dart';
import 'package:intl/intl.dart';

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
        massageTime: DateFormat("HH:mm", 'en_US').format(
            DateTime.tryParse(value.massageData ?? "") ?? DateTime.now()),
      ));

    }
    return ConversationMassageResponseEntity(
      massages: massages,
    );
  }
}
