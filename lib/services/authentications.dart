import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokedoke/models/user_model.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signup(UserModel user) async {
    String msg = "Sign up failed.";
    try {
      UserCredential credentials = await _auth.createUserWithEmailAndPassword(
        email: user.userEmail!,
        password: user.userPassword!,
      );
      if (credentials.user != null) {
        user.userId = credentials.user!.uid;
        await _firestore.collection('users').doc(credentials.user!.uid).set({
          'name': user.userName,
          'email': user.userEmail,
          'password': user.userPassword,
          'id': user.userId,
        });
        return "success";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The email is already in use.';
      }
    }
    return msg;
  }

  Future<String> login(UserModel user) async {
    String msg = 'An error occured';
    try {
      await _auth.signInWithEmailAndPassword(email: user.userEmail!, password: user.userPassword!);
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'User not found';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password';
      }
    }
    return msg;
  }

  signOut() async {
    await _auth.signOut();
  }
}
