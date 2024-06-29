class ErrorResponse {
  ErrorResponse({
    this.code,
  });

  ErrorResponse.fromJson(dynamic json) {
    code = json['code'];
  }

  String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    return map;
  }
}
