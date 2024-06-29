class Items {
  Items({
    this.massage,
    this.minemassage,
  });

  Items.fromJson(dynamic json) {
    massage = json['massage'];
    minemassage = json['mine-massage'];
  }

  String? massage;
  bool? minemassage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['massage'] = massage;
    map['mine-massage'] = minemassage;
    return map;
  }
}
