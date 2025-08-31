import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedoke/database/cloud/firestore_methods.dart';
import 'package:pokedoke/models/user_model.dart';
import 'dart:convert';
import 'package:pokedoke/services/authentications.dart';
import 'package:pokedoke/widgets/snackbar.dart';
part 'user_event.dart';
part 'user_state.dart';

bool mounted = true;

class UserBloc extends HydratedBloc<UserEvent, UserState> {
  UserBloc()
      : super(UserState(
            user: UserModel(
                userId: null,
                userName: null,
                userEmail: null,
                userPassword: null,
                isSignedUp: false,
                isLoggedIn: false))) {
    on<LoginUser>(_loginUser);
    on<SignupUser>(_signupUser);
    on<SetUserNameId>(_setNameId);
    on<LogoutUser>(_logoutUser);
  }

  _logoutUser(LogoutUser event, Emitter<UserState> emit) async {
    await Authentication().signOut();
    UserModel user = UserModel(
        userEmail: state.user.userEmail,
        userPassword: state.user.userPassword,
        userName: state.user.userName,
        userId: state.user.userId,
        isLoggedIn: false,
        isSignedUp: true);
    emit(UserState(user: user));
  }

  _setNameId(SetUserNameId event, Emitter<UserState> emit) async {
    UserModel user = UserModel(
        userEmail: state.user.userEmail,
        userPassword: state.user.userPassword,
        userName: event.name,
        userId: event.id,
        isLoggedIn: true,
        isSignedUp: true);
    emit(UserState(user: user));
  }

  _loginUser(LoginUser event, Emitter<UserState> emit) async {
    String result = await Authentication().login(event.user);
    if (result == "success") {
      String _name = await getUserName(FirebaseAuth.instance.currentUser!.uid);
      String _id = FirebaseAuth.instance.currentUser!.uid;
      emit(UserState(
          user: UserModel(
              userEmail: event.user.userEmail,
              userPassword: event.user.userPassword,
              userName: _name,
              userId: _id,
              isLoggedIn: true,
              isSignedUp: true)));
      if (mounted) {
        displaySnackbar(event.context, "success", "Welcome $_name");
      }
    } else {
      emit(UserState(
          user: UserModel(
              userEmail: event.user.userEmail,
              userPassword: event.user.userPassword,
              userName: event.user.userName,
              userId: event.user.userId,
              isLoggedIn: false,
              isSignedUp: false)));
      if (mounted) {
        displaySnackbar(event.context, "error", result);
      }
    }
  }

  _signupUser(SignupUser event, Emitter<UserState> emit) async {
    String result = await Authentication().signup(event.user);
    if (result == 'success') {
      emit(UserState(
          user: UserModel(
              userEmail: event.user.userEmail,
              userPassword: event.user.userPassword,
              userName: event.user.userName,
              userId: event.user.userId,
              isLoggedIn: false,
              isSignedUp: true)));
    } else {
      emit(UserState(
          user: UserModel(
              userEmail: event.user.userEmail,
              userPassword: event.user.userPassword,
              userName: event.user.userName,
              userId: event.user.userId,
              isLoggedIn: false,
              isSignedUp: false)));
    }
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    return UserState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    return state.toMap();
  }
}
