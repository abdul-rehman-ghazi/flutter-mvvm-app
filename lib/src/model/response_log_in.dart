class ResponseLogIn {
  late String accessToken;
  late int accessTokenExpiry;
  late String refreshToken;
  late int refreshTokenExpiry;

  ResponseLogIn({
    required this.accessToken,
    required this.accessTokenExpiry,
    required this.refreshToken,
    required this.refreshTokenExpiry,
  });
 
  ResponseLogIn.fromJson(dynamic json) {
    accessToken = json['accessToken'];
    accessTokenExpiry = json['accessTokenExpiry'];
    refreshToken = json['refreshToken'];
    refreshTokenExpiry = json['refreshTokenExpiry'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    map['accessTokenExpiry'] = accessTokenExpiry;
    map['refreshToken'] = refreshToken;
    map['refreshTokenExpiry'] = refreshTokenExpiry;
    return map;
  }
}
