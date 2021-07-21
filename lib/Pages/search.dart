import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Album> _album = List<Album>();
  Future<List<Album>> fetchAlbum() async {
    var url =
        'https://test.extensionceramics.com/api/method/erpnext.accounts.doctype.purchase_invoice.purchase_invoice.tally_integration';
    var response = await http.get(Uri.parse(url));
    var album = List<Album>();

    if (response.statusCode == 200) {
      var albumsJson = json.decode(response.body);
      for (var albumJson in albumsJson) {
        album.add(Album.fromJson(albumJson));
      }
    }
    return album;
  }

  void initState() {
    fetchAlbum().then((value) {
      setState(() {
        _album.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Search"),
        ),
        body: ListView.builder(
            itemCount: _album.length,
            itemBuilder: (context, index) {
              return Card(
                  // color: Colors.black,
                  child: Padding(
                padding: EdgeInsets.only(),
                child: Column(
                  children: [
                    Text(_album[1].suppliername),
                  ],
                ),
              ));
            }));
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

  String toJson() => json.encode(toMap());

  factory Album.fromJson(String source) => Album.fromMap(json.decode(source));
}
