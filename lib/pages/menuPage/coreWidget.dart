import 'package:flutter/material.dart';

class CoreWidget extends StatefulWidget {
  @override
  _CoreWidgetState createState() => _CoreWidgetState();
}

class _CoreWidgetState extends State<CoreWidget> {
  String _selectedItem = "Item 1";
  List<String> _items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
  ];

  bool _switchValue = false;
  double _sliderValue = 0.0;
  int _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Screen"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dropdown Button",
              style: TextStyle(fontSize: 20.0),
            ),
            DropdownButton<String>(
              value: _selectedItem,
              items: _items.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value!;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              "Switch",
              style: TextStyle(fontSize: 20.0),
            ),
            Switch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              "Slider",
              style: TextStyle(fontSize: 20.0),
            ),
            Slider(
              value: _sliderValue,
              min: 0.0,
              max: 100.0,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              "Radio Button",
              style: TextStyle(fontSize: 20.0),
            ),
            Row(
              children: [
                Radio(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    setState(() {
                      _radioValue = value as int;
                    });
                  },
                ),
                Text("Option 1"),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    setState(() {
                      _radioValue = value as int;
                    });
                  },
                ),
                Text("Option 2"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
