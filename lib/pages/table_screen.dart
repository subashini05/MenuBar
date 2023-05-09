import 'package:flutter/material.dart';

class TableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Layout'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            child: Text('Go back'),
            onPressed: () {
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 50.0,
                  color: Colors.blueGrey,
                  child: Center(
                    child: Text('English'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50.0,
                  color: Colors.green,
                  child: Center(
                    child: Text('98'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 50.0,
                  color: Colors.pink,
                  child: Center(
                    child: Text('Telugu'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50.0,
                  color: Colors.orange,
                  child: Center(
                    child: Text('89'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 50.0,
                  color: Colors.red,
                  child: Center(
                    child: Text('Hindi'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50.0,
                  color: Colors.teal,
                  child: Center(
                    child: Text('45'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
