import 'package:firebase_authentication/components/bottomBar.dart';
import 'package:firebase_authentication/screens/sign_in_page.dart';
import 'package:firebase_authentication/services/authentication_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text('Welcome'),
              ),
              RaisedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    ),
                  );
                },
                child: Text("Sign out"),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
