import 'package:firebase_authentication/components/bottomBar.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
