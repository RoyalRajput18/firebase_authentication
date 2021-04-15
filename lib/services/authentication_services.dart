import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  // signInUser({String email, String password}) async {
  //   final User firebaseUser = (await _firebaseAuth
  //           .signInWithEmailAndPassword(email: email, password: password)
  //           .catchError((errMsg) {
  //     displayToastMessage('Error: ' + errMsg.toString(), context);
  //   }))
  //       .user;

  //   if (firebaseUser != null) {
  // Map userDataMap = {
  //   'email': emailTextEditingController.text.trim(),
  // };

  // userRef.child(firebaseUser.uid).set(userDataMap);
  //     displayToastMessage('Congratulations, Login successfull', context);

  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => HomeScreen(),
  //       ),
  //     );
  //   } else {
  //     displayToastMessage('Login failed', context);
  //   }
  // }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
