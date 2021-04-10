import 'package:firebase_authentication/components/bottomBar.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Setting'),
        ),
        body: Container(
          child: Center(
            child: Text('This is setting page'),
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
