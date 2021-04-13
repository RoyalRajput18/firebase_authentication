import 'package:firebase_authentication/pages/setup/components/bottomBar.dart';
import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Schedule'),
        ),
        body: Container(
          child: Center(
            child: Text('This is schedule page'),
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
