import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var url = 'https://jsonplaceholder.typicode.com/users';

  Future<List> getData() async {
    var res =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    var jsonData = jsonDecode(res.body);
    List<User> users = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}
//  body: FutureBuilder(
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Center(
//                 child: Text("Error"),
//               );
//             } else if (snapshot.hasData) {
//               print(snapshot.data);
//               return Center(
//                 child: Text("Data"),
//               );
//             }
//           },
//           future: getData(),
//         )
// class User {
//   String username;
//   String name;
//   User({this.username, this.name});
// }
// //
