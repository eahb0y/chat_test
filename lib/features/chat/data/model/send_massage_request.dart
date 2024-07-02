class SendMassageRequest {
  SendMassageRequest({
    this.massage,
    this.massageData,
    this.massageId,
    this.massageSender,
    this.conversationId = "",
  });

  SendMassageRequest.fromJson(dynamic json) {
    massage = json['massage'];
    massageData = json['massage_data'];
    massageId = json['massage_id'];
    massageSender = json['massage_sender'];
  }

  String? massage;
  String? massageData;
  String? massageId;
  String? massageSender;
  String conversationId = "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['massage'] = massage;
    map['massage_data'] = massageData;
    map['massage_id'] = massageId;
    map['massage_sender'] = massageSender;
    return map;
  }
}
