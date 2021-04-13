import 'package:firebase_authentication/pages/setup/components/bottomBar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Container(
          child: Center(
            child: Text('This is home Screen'),
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
