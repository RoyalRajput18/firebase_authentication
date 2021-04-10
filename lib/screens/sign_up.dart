import 'package:firebase_authentication/constants/constants.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                      hintText: 'Name',
                    ),
                    SizedBox(
                      height: 20,
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
}
