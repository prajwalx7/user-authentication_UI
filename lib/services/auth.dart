import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign up
  Future<User?> signUpMethod(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Email is already registered. Please try logging in.'),
        ),
      );
      return null;
    }
  }

  // sign in
  Future<User?> signinMethod(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      return null;
    }
  }

  // sing in with google
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? silentSignIn =
          await GoogleSignIn().signInSilently();

      if (silentSignIn != null) {
        await GoogleSignIn().signOut();
      }

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      return null;
    }
  }

  // apple

  // Future<UserCredential?> signInWithApple() async {
  //   try {
  //     final appleCredential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );

  //     final oAuthProvider = OAuthProvider("apple.com");
  //     final credential = oAuthProvider.credential(
  //       idToken: appleCredential.identityToken,
  //       accessToken: appleCredential.authorizationCode,
  //     );

  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   } catch (e) {
  //     print("Error signing in with Apple: $e");
  //     return null;
  //   }
  // }
}
