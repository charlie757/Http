import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:test_app/Pages/data.dart';

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text("Search"),
        ),
        body: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: [
            card('assets/images/OIP (22).jpg', 'Banana'),
            card('assets/images/OIP (17).jpg', 'Orange'),
            card('assets/images/OIP (20).jpg', 'Ananas'),
            card('assets/images/OIP (16).jpg', 'Strawberry'),
            card('assets/images/OIP (22).jpg', 'Banana'),
            card('assets/images/OIP (17).jpg', 'Orange'),
            card('assets/images/OIP (20).jpg', 'Ananas'),
            card('assets/images/OIP (16).jpg', 'Strawberry')
          ],
        ));
  }

  Card card(String img, String name) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            img,
            fit: BoxFit.cover,
            height: 100,
            width: 100,
          ),
          Text(name),
        ],
      ),
    );
  }
}
