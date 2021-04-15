import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  /// This won't pop routes so you could do something like
  /// Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  /// after you called this method if you want to pop all routes.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  // signInUser(BuildContext context) async {
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

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
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
