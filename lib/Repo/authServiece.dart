import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthServiece{
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static User? get user => _auth.currentUser;

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      EasyLoading.show();
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      EasyLoading.dismiss();
      return result.user;
    } catch (error) {
      EasyLoading.dismiss();
      if(error.toString().contains('The email address is badly formatted'))
        {
          Fluttertoast.showToast(
            msg: 'The email address is badly formatted',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
          );
        }
      else if(error.toString().contains('There is no user record corresponding to this identifier'))
        {
          Fluttertoast.showToast(
            msg: 'There is no user record corresponding to this identifier',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
          );
        }
      else if(error.toString().contains('The password is invalid or the user does not have a password'))
      {
        Fluttertoast.showToast(
          msg: 'The password is invalid or the user does not have a password',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
        );
      }
      else
      {
        Fluttertoast.showToast(
          msg: 'Login Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
        );
      }
      print('Error signing in: $error');
      return null;
    }
  }

  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      EasyLoading.show();
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      EasyLoading.dismiss();
      return result.user;
    } catch (error) {
      EasyLoading.dismiss();
      print('Error registering user: $error');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      EasyLoading.show();
      await _auth.signOut();
      print('User signed out');
      EasyLoading.dismiss();
    } catch (error) {
      EasyLoading.dismiss();
      print('Error signing out: $error');
    }
  }

}