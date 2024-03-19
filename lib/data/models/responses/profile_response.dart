class Profile {
  String? firstName;
  String? lastName;
  int? gender;
  int? role;
  int? activeStatus;
  String? address;
  Null? profilePicturePath;
  String? phoneNumber;
  String? email;
  int? id;

  Profile(
      {this.firstName,
        this.lastName,
        this.gender,
        this.role,
        this.activeStatus,
        this.address,
        this.profilePicturePath,
        this.phoneNumber,
        this.email,
        this.id});

  Profile.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    role = json['role'];
    activeStatus = json['activeStatus'];
    address = json['address'];
    profilePicturePath = json['profilePicturePath'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['role'] = this.role;
    data['activeStatus'] = this.activeStatus;
    data['address'] = this.address;
    data['profilePicturePath'] = this.profilePicturePath;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['id'] = this.id;
    return data;
  }
}
