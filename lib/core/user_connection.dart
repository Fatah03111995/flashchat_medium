// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat_medium/core/constants/constant.dart';
import 'package:flashchat_medium/ui/components/util_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserConnection {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> logIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential response = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (response.user == null) {
        UtilComponent.showSnackBarErr(context, 'Please Try Again');
      }
      UtilComponent.showSnackBarSuccess(context, 'Login Success');
      return {
        'user': response.user,
        'token': 'token-barrier ${response.credential?.token}'
      };
    } on PlatformException catch (e) {
      UtilComponent.showSnackBarErr(context, 'Platform error : ${e.message}');
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          UtilComponent.showSnackBarErr(context, 'User Not Found !');
          break;
        case 'wrong-password':
          UtilComponent.showSnackBarErr(context, 'Wrong Password !');
          break;
        case 'invalid-email':
          UtilComponent.showSnackBarErr(
              context, 'Your Email Address is not valid !');
          break;
        case 'invalid-credential':
          UtilComponent.showSnackBarErr(
              context, 'Make Sure You Write The Right Password and Email');
          break;
        default:
          UtilComponent.showSnackBarErr(
              context, 'Firebase Auth Exception : ${e.code}');
      }
    } catch (e) {
      UtilComponent.showSnackBarErr(context, 'unknown error catch : $e');
    }
    return null;
  }
  //-------------- LOG IN END

  Future<void> logOut() async {
    return await _auth.signOut();
  }
  //------------- LOG OUT END

  Future<User?> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (response.user == null) {
        UtilComponent.showSnackBarErr(context, 'Please Try Again');
      }
      UtilComponent.showSnackBarSuccess(
          context, 'Sign in is success, Please Login');
      return response.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          UtilComponent.showSnackBarErr(
              context, 'Email has been use, please fill with another one');
          break;
        default:
          UtilComponent.showSnackBarErr(
              context, 'Firebase Auth Exception : ${e.code}');
      }
    } catch (e) {
      UtilComponent.showSnackBarErr(context, 'unknown error catch : $e');
    }
    return null;
  }

  void sendMessage({required String text, required String? sender}) {
    _fireStore
        .collection(messageCollectionPath)
        .add({'text': text, 'sender': sender});
  }
}
