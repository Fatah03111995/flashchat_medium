// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat_medium/ui/components/util_component.dart';
import 'package:flashchat_medium/ui/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserConnection {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  Future<User?> logIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential response = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return response.user;
    } on PlatformException catch (e) {
      UtilComponent.showSnackBar(context, 'Platform error : ${e.message}');
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          UtilComponent.showSnackBar(context, 'User Not Found !');
          break;
        case 'wrong-password':
          UtilComponent.showSnackBar(context, 'Wrong Password !');
          break;
        case 'invalid-email':
          UtilComponent.showSnackBar(
              context, 'Your Email Address is not valid !');
          break;
        default:
          UtilComponent.showSnackBar(
              context, 'Make Sure You Wirte Right Email and Password !');
      }
    } catch (e) {
      UtilComponent.showSnackBar(context, 'unknown error catch : $e');
    }
    return null;
  }
  //-------------- SIGN IN END

  Future<void> logOut() async {
    return await _auth.signOut();
  }
  //------------- SIGN OUT END
}
