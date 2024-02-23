import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/view/library_page.dart';
import 'package:first_project/utils/uiHelper.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  final auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId:
        '308811835817-bn2j2sv89o076ng4ce1n0684clge78fo.apps.googleusercontent.com',
  );

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? userAccount = await googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(credentials);

      // Check if the user is signed in
      if (userCredential.user != null) {
        // Navigate to HomePage
        print("Hello");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Library()));
      }
    } catch (e) {
      print(e.toString());
      UiHelper.CustomAlertBox(context, e.toString());
    }
  }

  static Future<UserCredential?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (e) {
      print("Failed to sign up: $e");
      return null;
    }
  }

}
