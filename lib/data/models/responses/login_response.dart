class LoginRequestResponse {
  String? message;
  LoginResponse? loginResponse;

  LoginRequestResponse({this.message, this.loginResponse});

  LoginRequestResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    loginResponse = json['loginResponse'] != null
        ? new LoginResponse.fromJson(json['loginResponse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.loginResponse != null) {
      data['loginResponse'] = this.loginResponse!.toJson();
    }
    return data;
  }
}

class LoginResponse {
  String? firstName;
  String? lastName;
  String? email;
  String? token;
  String? refreshToken;

  LoginResponse(
      {this.firstName,
      this.lastName,
      this.email,
      this.token,
      this.refreshToken});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['token'] = this.token;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}
