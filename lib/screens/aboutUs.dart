import 'package:firebase_authentication/components/bottomBar.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
        ),
        body: Container(
          child: Center(
            child: Text('This is about us page'),
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
