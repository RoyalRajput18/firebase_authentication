import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/constants/constants.dart';
import 'package:firebase_authentication/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  bool wrongPassword;
  bool wrongEmail;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  BackArrowIcon(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TitleText(
                          title: 'Hello Again! \nWelcome \nback',
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        InputTextField(
                          hintText: 'Email Address',
                          obscure: false,
                          validator: Validators.compose([
                            Validators.required('Email is required'),
                            Validators.email('Invalid email address'),
                          ]),
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InputTextField(
                          hintText: 'Password',
                          obscure: true,
                          validator: Validators.compose([
                            Validators.required('Password is required'),
                            Validators.patternString(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                                'Invalid Password')
                          ]),
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Button(
                          buttonText: 'Sign In',
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                              wrongEmail = false;
                              wrongPassword = false;
                            });
                            try {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (user != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              }
                              setState(() {
                                showSpinner = false;
                              });
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SmallTextUnderButton(
                          leftSideText: 'Forget your password?',
                          rightSideText: 'Signup',
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        BottomImage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
