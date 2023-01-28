// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// //This is for test currently and should not be used until data management is done

// final FirebaseAuth _auth = FirebaseAuth.instance;

// // ignore: non_constant_identifier_names
// Future<void> userSetup(String Name) async {
//   final User? currentUser = _auth.currentUser;

//   FirebaseAuth auth = FirebaseAuth.instance;
//   String uid = auth.currentUser!.uid.toString();
//   CollectionReference users = FirebaseFirestore.instance.collection("Users");
//   users.doc(currentUser?.uid).update({"Name": Name, "uid": uid});
//   return;
// }
