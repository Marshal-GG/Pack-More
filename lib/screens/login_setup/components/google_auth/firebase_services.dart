import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:project_jh/services/userprovider.dart';

class FirebaseServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  User? currentUser;
  String? userName;
  String? userEmail;

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
        currentUser = _auth.currentUser;
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(currentUser?.uid)
            .set({
          "Name": currentUser?.displayName,
          "Email": currentUser?.email,
        }, SetOptions(merge: true));
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(currentUser?.uid)
            .collection("Details")
            .doc("Basic Info")
            .set({
          "GName": currentUser?.displayName,
          "Email": currentUser?.email,
          "Uid": currentUser?.uid,
          "Photo URL": currentUser?.photoURL,
        }, SetOptions(merge: true));
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(currentUser?.uid)
            .collection('Details')
            .doc('Provided Info')
            .set({
          "GNumber": currentUser?.phoneNumber,
        }, SetOptions(merge: true));
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(currentUser?.uid)
            .collection('Details')
            .doc('Address')
            .set({
          "Address": "",
          "City": "",
          "Zipcode": "",
        }, SetOptions(merge: true));
      }
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      throw e;
    }
  }

  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
