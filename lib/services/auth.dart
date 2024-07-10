import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//sign up
  Future<User?> signupMethod(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        throw 'Email and password must not be empty';
      }
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Error signing up: $e");
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
      print("Error signing up: $e");
      return null;
    }
  }

  
}


