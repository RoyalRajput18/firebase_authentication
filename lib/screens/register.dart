import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/Providerhelper/providerState.dart';
import 'package:firebase_authentication/constants/constants.dart';
import 'package:firebase_authentication/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  String email;
  String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // void _signUp(String email, String password, BuildContext context) async {
  //   ProviderState _providerState =
  //       Provider.of<ProviderState>(context, listen: false);
  //   try {
  //     if (await _providerState.signUpUser(email, password)) {
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => SignIn()));
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

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
                      obscure: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InputTextField(
                      hintText: 'Email Address',
                      obscure: false,
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
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Button(
                      buttonText: 'Sign Up',
                      onPressed: () async {
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newUser != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignIn(),
                              ),
                            );
                          }
                        } on Exception catch (e) {
                          print(e);
                        }
                        // // RegisterUser();
                        // _signUp(email, password, context);
                      },
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => HomeScreen(),
                      //   ),
                      // );
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
