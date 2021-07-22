import 'package:flutter/material.dart';
import 'package:test_app/Pages/data.dart';

class Home2 extends StatefulWidget {
  Home2({Key key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: ListView.builder(
            itemCount: modal1.length,
            itemBuilder: (context, index) {
              Modal modal = modal1[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    child: Image.asset(
                      modal.img,
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  title: Text(modal.name),
                ),
              );
            }));
  }
}
