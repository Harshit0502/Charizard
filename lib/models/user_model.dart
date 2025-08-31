import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? userId;
  String? userName;
  String? userEmail;
  String? userPassword;
  bool isLoggedIn;
  bool isSignedUp;
  
  UserModel({
    this.userId,
    this.userName,
    this.userEmail,
    this.userPassword,
    required this.isLoggedIn,
    required this.isSignedUp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'userPassword': userPassword,
      'isLoggedIn': isLoggedIn,
      'isSignedUp': isSignedUp,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] != null ? map['userId'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      userEmail: map['userEmail'] != null ? map['userEmail'] as String : null,
      userPassword:
          map['userPassword'] != null ? map['userPassword'] as String : null,
      isLoggedIn: map['isLoggedIn'] as bool,
      isSignedUp: map['isSignedUp'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
