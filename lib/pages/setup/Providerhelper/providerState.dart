// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ProviderState extends ChangeNotifier {
//   String name;
//   String uid;
//   String email;
//   String get getName => name;
//   String get getUid => uid;
//   String get getEmail => email;
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   Future<bool> signUpUser(String name, String email, String password) async {
//     bool retval = false;
//     try {
//       UserCredential userCredential = await _auth
//           .createUserWithEmailAndPassword(email: email, password: password);
//       if (userCredential.user != null) {
//         uid = userCredential.user.uid;
//         email = userCredential.user.email;
//         return retval = true;
//       }
//     } catch (e) {
//       print(e);
//     }
//     return retval;
//   }

//   Future<bool> loginUser(String email, String password) async {
//     bool retval = false;
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       if (userCredential.user != null) {
//         uid = userCredential.user.uid;
//         email = userCredential.user.email;
//         return retval = true;
//       }
//     } catch (e) {
//       print(e);
//     }
//     return retval;
//   }
// }
