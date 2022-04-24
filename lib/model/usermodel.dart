class UserModel {
  String? uid;
  String? name;
  String? lastName;
  String? emailId;

  UserModel({
    this.uid,
    this.name,
    this.lastName,
    this.emailId,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'lastName': lastName,
        'emailId': emailId,
      };

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
        uid: json['id'],
        name: json['name'],
        lastName: json['lastname'],
        emailId: json['emailid']);
  }
}
