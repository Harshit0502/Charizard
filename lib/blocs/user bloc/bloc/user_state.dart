// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'user_bloc.dart';

@immutable
class UserState {
  UserModel user;
  UserState({
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    return UserState(
      user: UserModel.fromMap(map['user'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserState.fromJson(String source) => UserState.fromMap(json.decode(source) as Map<String, dynamic>);
}
