import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fruits"),
        ),
        body: ListView(
          children: [
            Card(
                child: Container(
              child: Image.asset('assets/images/OIP (16).jpg'),
            )),
            Card(
                child: Container(
              child: Image.asset('assets/images/OIP (17).jpg'),
            )),
            Card(
                child: Container(
              child: Image.asset('assets/images/OIP (22).jpg'),
            )),
            Card(
                child: Container(
              child: Image.asset('assets/images/OIP (21).jpg'),
            ))
          ],
        ));
  }
}
