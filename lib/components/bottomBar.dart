import 'package:firebase_authentication/screens/aboutUs.dart';
import 'package:firebase_authentication/screens/home.dart';
import 'package:firebase_authentication/screens/profile.dart';
import 'package:firebase_authentication/screens/schedule.dart';
import 'package:firebase_authentication/screens/setting.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      fixedColor: Colors.black,
      unselectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
            child: Icon(Icons.home),
          ),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
            },
            child: Icon(Icons.person),
          ),
          title: Text('Profile'),
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Schedule(),
                ),
              );
            },
            child: Icon(Icons.schedule),
          ),
          title: Text('Schedule'),
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Setting(),
                ),
              );
            },
            child: Icon(Icons.settings),
          ),
          title: Text('Setting'),
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUs(),
                ),
              );
            },
            child: Icon(Icons.info),
          ),
          title: Text('About US'),
        ),
      ],
    );
  }
}
