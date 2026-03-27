import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signupWithEmail(String email, String password) async {
    try {
       await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return print('Error : $e');
    }
  }

  Future<void> signinWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return print('Error : $e');
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
