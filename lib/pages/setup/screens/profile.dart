import 'package:firebase_authentication/pages/setup/components/bottomBar.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Container(
          child: Center(
            child: Text('This is profile page'),
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
