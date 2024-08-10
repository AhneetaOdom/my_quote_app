import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class FirebaseService {
  final firebaseAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

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
  saveUserToFireStore({required String fullName, required String email}) async {
    try {
      final user = firebaseAuth.currentUser;
      if (user != null) {
        await fireStore.collection('USERS').doc(user.uid).set({
          'fullName': fullName,
          'email': email,
        });
      }
    } on FirebaseException catch (e) {
      log('Error saving user to Firestore: $e');
    }
  }

  Future<UserModel?> getUserFromFireStore() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user != null) {
        final documentSnapshot = await fireStore.collection('USERS').doc(user.uid).get();
        if (documentSnapshot.exists) {
          final data = documentSnapshot.data();
          log('User data: ${firebaseAuth.currentUser?.photoURL}');
          return UserModel(
              fullName: data?['fullName'],
              email: data?['email'],
              profilePictureUrl: firebaseAuth.currentUser?.photoURL
          );
        } else {
          log('No user document found for ID: ${user.uid}');
          return null;
        }
      } else {
        log('No user signed in.');
        return null;
      }
    } on FirebaseException catch (e) {
      log('Error retrieving user from Firestore: $e');
      return null;
    }
  }

  Future<void>logOutUser() async{
    await firebaseAuth.signOut();
  }

}

