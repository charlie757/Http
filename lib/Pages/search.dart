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
        body: GridView.builder(
            itemCount: modal1.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              Modal modal = modal1[index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      modal.img,
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ),
                    Text(modal.name),
                  ],
                ),
              );
            }));
  }
}
