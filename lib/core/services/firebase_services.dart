import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Firebase authentication methods
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Failed to sign in: $e');
      return null;
    } catch (e) {
      print('Failed to sign in: $e');
      return null;
    }
  }

  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Failed to create user: $e');
      return null;
    } catch (e) {
      print('Failed to create user: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Firestore methods
  Future<DocumentSnapshot<Map<String, dynamic>>?> getUserProfile(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore.collection('users').doc(uid).get();
      return snapshot;
    } on FirebaseException catch (e) {
      print('Failed to get user profile: $e');
      return null;
    } catch (e) {
      print('Failed to get user profile: $e');
      return null;
    }
  }

  Future<void> updateUserProfile(String uid, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('Users').doc(uid).update(data);
    } on FirebaseException catch (e) {
      print('Failed to update user profile: $e');
    } catch (e) {
      print('Failed to update user profile: $e');
    }
  }
}
