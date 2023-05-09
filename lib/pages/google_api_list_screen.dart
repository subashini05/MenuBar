import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GoogleApiListScreen extends StatefulWidget {
  @override
  _GoogleApiListState createState() => _GoogleApiListState();
}

class _GoogleApiListState extends State<GoogleApiListScreen> {
  List<String> _items = [];

  Future<List<String>> _fetchData() async {
    final response = await http.get(Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q=flutter&maxResults=20'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final List<String> items = [];

      for (final item in data['items']) {
        final String title = item['volumeInfo']['title'];
        items.add(title);
      }

      return items;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData().then((items) {
      setState(() {
        _items = items;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Google API ListView Example'),
        ),
        body: Column(children: [
          ElevatedButton(
            child: Text('Go back'),
            onPressed: () {
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
          _items.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(_items[index]),
                    );
                  },
                ),
        ]));
  }
}
