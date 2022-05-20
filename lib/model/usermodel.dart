// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  // Map<String, dynamic> toJson() => {
  //       'uid': uid,
  //       'name': name,
  //       'lastName': lastName,
  //       'emailId': emailId,
  //     };

  // static UserModel fromJson(dynamic json) {
  //   return UserModel(
  //       uid: json['id'] ?? '',
  //       name: json['name'] ?? '',
  //       lastName: json['lastname'] ?? '',
  //       emailId: json['emailid'] ?? '');
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'lastName': lastName,
      'emailId': emailId,
    };
  }

  factory UserModel.fromMap(dynamic map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      emailId: map['emailId'] != null ? map['emailId'] as String : null,
    );
  }


}
