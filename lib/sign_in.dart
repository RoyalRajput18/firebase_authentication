import 'package:firebase_authentication/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                      title: 'Hello Again! \nWelcome \nback',
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    InputTextField(
                      hintText: 'Email Address',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InputTextField(hintText: 'Password'),
                    SizedBox(
                      height: 30,
                    ),
                    Button(
                      buttonText: 'Sign In',
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
    );
  }
}
