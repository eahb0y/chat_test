class ConversationMassageResponseEntity {
  final Set<MassageEntity> massages;

  ConversationMassageResponseEntity({required this.massages});
}

class MassageEntity {
  final String? massage;
  final String? massageId;
  final String? massageSender;
  final String? massageData;
  final String? massageTime;

  MassageEntity({
    required this.massage,
    required this.massageId,
    required this.massageSender,
    required this.massageData,
    this.massageTime,
  });
}
