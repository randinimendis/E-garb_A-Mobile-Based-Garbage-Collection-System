// To parse this JSON data, do
//
//     final otpResponse = otpResponseFromJson(jsonString);

import 'dart:convert';

OtpResponse otpResponseFromJson(String str) => OtpResponse.fromJson(json.decode(str));

String otpResponseToJson(OtpResponse data) => json.encode(data.toJson());

class OtpResponse {
  String? firstName;
  String? lastName;
  String? email;
  String? token;
  String? refreshToken;
  int? id;

  OtpResponse({
    this.firstName,
    this.lastName,
    this.email,
    this.token,
    this.refreshToken,
    this.id,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) => OtpResponse(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    token: json["token"],
    refreshToken: json["refreshToken"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "token": token,
    "refreshToken": refreshToken,
    "id": id,
  };
}
