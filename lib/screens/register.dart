import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/main.dart';
import 'package:firebase_authentication/constants/constants.dart';
import 'package:firebase_authentication/screens/sign_in_page.dart';
import 'package:firebase_authentication/services/authentication_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
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
                      title: 'Hello! \nSignup to \nget started',
                    ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(8.0),
                    //   child: Image(
                    //     image: AssetImage('images/profile.png'),
                    //     height: 150.0,
                    //     width: 100.0,
                    //   ),
                    // ),
                    SizedBox(
                      height: 35,
                    ),
                    InputTextField(
                      controller: nameTextEditingController,
                      hintText: 'Name',
                      obscure: false,
                    ),
                    SizedBox(
                      height: 20,
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
                      controller: passwordTextEditingController,
                      hintText: 'Password',
                      obscure: true,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Button(
                      buttonText: 'Sign Up',
                      onPressed: () {
                        setState(() {
                          return LinearProgressIndicator();
                        });
                        if (nameTextEditingController.text.length < 3) {
                          displayToastMessage(
                              'Name must be at least 3 characters', context);
                        } else if (!emailTextEditingController.text
                            .contains('@')) {
                          displayToastMessage(
                              'Email address is invalid', context);
                        } else if (passwordTextEditingController.text.length <
                            6) {
                          displayToastMessage(
                              'Name must be at least 6 characters', context);
                        } else {
                          context.read<AuthenticationService>().signUp(
                                email: emailTextEditingController.text.trim(),
                                password:
                                    passwordTextEditingController.text.trim(),
                              );
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SmallTextUnderButton(
                      leftSideText: 'Already a user ?',
                      rightSideText: 'sign in',
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
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  registerNewUser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      displayToastMessage('Error: ' + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) {
      Map userDataMap = {
        'name': nameTextEditingController.text.trim(),
        'email': emailTextEditingController.text.trim(),
      };

      userRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage(
          'Congratulations, Your account has been created', context);
      setState(() {
        showSpinner = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignInPage(),
        ),
      );
    } else {
      displayToastMessage('New user account has not been created', context);
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
