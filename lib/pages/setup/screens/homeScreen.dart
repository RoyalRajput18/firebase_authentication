import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/pages/setup/components/bottomBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: Container(
          child: Center(
            child: Text('Welcome'),
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
