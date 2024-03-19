class SignUpRequest {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;

  SignUpRequest(
      {this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.password});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    firstName = json['firstname'];
    lastName = json['lastname'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstName;
    data['lastname'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
