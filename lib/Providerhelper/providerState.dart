import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/screens/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProviderState extends ChangeNotifier {
  String _name;
  String _uid;
  String _email;
  String get getName => _name;
  String get getUid => _uid;
  String get getEmail => _email;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<bool> signUpUser(String name, String email, String password) async {
    bool retval = false;
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => SignIn(),
        //   ),
        // );
      }
    } catch (e) {
      print(e);
    }
    return retval;
  }

  Future<bool> loginUser(String email, String password) async {
    bool retval = false;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        _uid = userCredential.user.uid;
        _email = userCredential.user.email;
        return retval = true;
      }
    } catch (e) {
      print(e);
    }
    return retval;
  }
}
