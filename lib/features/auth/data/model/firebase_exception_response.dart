class FirebaseExceptionResponse {
  FirebaseExceptionResponse({
      this.code, 
      this.message,});

  FirebaseExceptionResponse.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
  }
  String? code;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    return map;
  }

}