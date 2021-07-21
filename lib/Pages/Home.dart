import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Album> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'https://test.extensionceramics.com/api/method/erpnext.accounts.doctype.purchase_invoice.purchase_invoice.tally_integration'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Album> futureAlbum;
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Fetch Data Example'),
          ),
          body: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(itemBuilder: (context, i) {
                  return Card(
                    child: Column(
                      children: [
                        Text(snapshot.data.cost),
                        Text(snapshot.data.againstexpenseaccount.toString()),
                      ],
                    ),
                  );
                });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          )),
    );
  }
}

class Album {
  final String purchaseinvoiceno;
  final String supplier;
  final String suppliername;
  final String postingdate;
  final String creditto;
  final String againstexpenseaccount;
  final String cost;

  Album({
    this.purchaseinvoiceno,
    this.supplier,
    this.suppliername,
    this.postingdate,
    this.creditto,
    this.againstexpenseaccount,
    this.cost,
  });

  Map<String, dynamic> toMap() {
    return {
      'purchaseinvoiceno': purchaseinvoiceno,
      'supplier': supplier,
      'suppliername': suppliername,
      'postingdate': postingdate,
      'creditto': creditto,
      'againstexpenseaccount': againstexpenseaccount,
      'cost': cost,
    };
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      purchaseinvoiceno: map['purchaseinvoiceno'],
      supplier: map['supplier'],
      suppliername: map['suppliername'],
      postingdate: map['postingdate'],
      creditto: map['creditto'],
      againstexpenseaccount: map['againstexpenseaccount'],
      cost: map['cost'],
    );
  }

  String toJson() => json.encode(toString());

  factory Album.fromJson(String source) => Album.fromMap(json.decode(source));
}
