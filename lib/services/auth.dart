import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_authentication/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //user object based on firebase user
  User _userFromFirebaseUser(Firebase user) {
    return user != null ? User(uid: user.uid) : null;
  }
  //sign in with email & Password

  //register with email & password

}
