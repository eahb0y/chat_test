class NewUserAuthRequest {
  NewUserAuthRequest({
    this.email,
    this.password,
  });

  NewUserAuthRequest.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }

  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}
