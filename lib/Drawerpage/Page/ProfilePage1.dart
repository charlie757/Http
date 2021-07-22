import 'package:flutter/material.dart';

class ProfilePage1 extends StatefulWidget {
  const ProfilePage1({Key key}) : super(key: key);

  @override
  _ProfilePage1State createState() => _ProfilePage1State();
}

class _ProfilePage1State extends State<ProfilePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}
