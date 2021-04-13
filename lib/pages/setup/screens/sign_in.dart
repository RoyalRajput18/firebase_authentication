import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/pages/setup/constants/constants.dart';
import 'package:firebase_authentication/main.dart';
import 'package:firebase_authentication/pages/setup/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool showSpinner = false;
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

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
                          controller: emailTextEditingController,
                          hintText: 'Email Address',
                          obscure: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InputTextField(
                          hintText: 'Password',
                          controller: passwordTextEditingController,
                          obscure: true,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Button(
                          buttonText: 'Sign In',
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            if (!emailTextEditingController.text
                                .contains('@')) {
                              displayToastMessage(
                                  'Email address is invalid', context);
                            } else if (passwordTextEditingController
                                    .text.length <
                                6) {
                              displayToastMessage(
                                  'Name must be at least 6 characters',
                                  context);
                            } else {
                              signInUser(context);

                              setState(() {
                                showSpinner = false;
                              });
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

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  signInUser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      displayToastMessage('Error: ' + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) {
      Map userDataMap = {
        'email': emailTextEditingController.text.trim(),
      };

      userRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage('Congratulations, Login successfull', context);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      displayToastMessage('Login failed', context);
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
