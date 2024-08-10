import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'weak-password':
          errorMessage = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          errorMessage = 'The account already exists for that email.';
          break;
        default:
          errorMessage = 'An unknown error occurred. Please try again.';
      }
      // You can either return null or throw an exception.
      print(errorMessage);
      return null;
      // Or if you prefer to throw the error:
      // throw FirebaseAuthException(code: e.code, message: errorMessage);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  /// Logs in a user with the provided email and password.
  Future<UserCredential?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided.';
          break;
        default:
          errorMessage = 'An unknown error occurred. Please try again.';
      }
      print(errorMessage);
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

}

