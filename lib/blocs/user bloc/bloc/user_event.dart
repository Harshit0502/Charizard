// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class LoginUser implements UserEvent {
  UserModel user;
  BuildContext context;
  LoginUser({
    required this.user,
    required this.context,
  });
}

class SignupUser implements UserEvent {
  UserModel user;
  SignupUser({
    required this.user,
  });
}

class LogoutUser implements UserEvent {

}

class SetUserNameId implements UserEvent {
  String name;
  String id;
  SetUserNameId({
    required this.name,
    required this.id,
  });
}

class SetUserId implements UserEvent {
  String id;
  SetUserId({
    required this.id,
  });
}
