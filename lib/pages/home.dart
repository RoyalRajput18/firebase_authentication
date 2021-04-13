// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Home extends StatelessWidget {
//   const Home({Key key, this.firebaseUser}) : super(key: key);
//   final User firebaseUser;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home ${firebaseUser.email}'),
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: Firestore.instance
//             .collection('users')
//             .document(firebaseUser.uid)
//             .snapshots(),
//         builder:
//             (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else if (snapshot.hasData) {
//             return checkRole(snapshot.data);
//           }
//           return LinearProgressIndicator();
//         },
//       ),
//     );
//   }

//   Center checkRole(DocumentSnapshot snapshot) {
//     if (snapshot.data == null) {
//       return Center(
//         child: Text('no data set in the userId document in firestore'),
//       );
//     }
//     if (snapshot.data['role'] == 'admin') {
//       return adminPage(snapshot);
//     } else {
//       return userPage(snapshot);
//     }
//   }

//   Center adminPage(DocumentSnapshot snapshot) {
//     return Center(
//         child: Text('${snapshot.data['role']} ${snapshot.data['name']}'));
//   }

//   Center userPage(DocumentSnapshot snapshot) {
//     return Center(child: Text(snapshot.data['name']));
//   }
// }
