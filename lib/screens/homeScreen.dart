import 'package:firebase_authentication/components/bottomBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
