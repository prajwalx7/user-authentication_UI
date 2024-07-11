import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<User?> signInWithGoogle() async {
  try {
    // Check if we can sign in silently
    final GoogleSignInAccount? silentSignIn = await GoogleSignIn().signInSilently();
    
    // If silent sign-in succeeds, sign out to force account chooser
    if (silentSignIn != null) {
      await GoogleSignIn().signOut();
    }

    // Now attempt to sign in, which will show the account chooser
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      // The user canceled the sign-in
      return null;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user;
  } catch (e) {
    print("Error signing in with Google: $e");
    return null;
  }
}
}
