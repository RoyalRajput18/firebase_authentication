import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //user object based on firebase user
  bool showSpinner = false;
  String userName;
  String email;
  String password;
}
//sign in with email & Password

//register with email & password
