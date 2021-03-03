import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Switchtrial(),
    );
  }
}

class Switchtrial extends StatefulWidget {
  @override
  _SwitchtrialState createState() => _SwitchtrialState();
}

class _SwitchtrialState extends State<Switchtrial> {
  bool _value1 = false;
  bool _value2 = false;
  double value3 = 0.0;
  String value4 = '';

  void onChanged1(bool value) => setState(() => _value1 = value);
  void onChanged2(bool value) => setState(() => _value2 = value);
  void _onchanged3(double val) => setState(() => value3 = val);
  Future _onchanged4() async {
    DateTime picked = await showDatePicker(
      firstDate: DateTime(2019),
      context: context,
      lastDate: DateTime(2022),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        value4 = picked.toString();
      });
    }
  }

  int _val = 0;
  List<BottomNavigationBarItem> _items;
  String _values = '';

  @override
  void initState() {
    _items = new List();
    _items.add(BottomNavigationBarItem(
      icon: Icon(Icons.access_alarm),
      title: Text("Clock"),
    ));
    _items.add(BottomNavigationBarItem(
      icon: Icon(Icons.map),
      title: Text("Map"),
    ));
    _items.add(BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text("Profile"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ),
      persistentFooterButtons: [
        IconButton(
          icon: Icon(Icons.access_alarm),
          onPressed: null,
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: null,
        ),
      ],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_values),
          Switch(
            onChanged: onChanged1,
            value: _value1,
            activeColor: Colors.red,
          ),
          SwitchListTile(
            onChanged: onChanged2,
            value: _value2,
            activeColor: Colors.red,
            title: Text("Value ${(value3 * 100).round()}"),
          ),
          Slider(
            onChanged: _onchanged3,
            value: value3,
          ),
          Text(value4),
          RaisedButton(
            onPressed: _onchanged4,
            child: Text("Click Me"),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            title: Text("Clock"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text("Map"),
          )
        ],
        fixedColor: Colors.blue,
        currentIndex: _val,
        onTap: (int _item) {
          setState(() {
            _val = _item;
            _values = "Current index is ${(_item.toString())}";
          });
        },
      ),
    );
  }
}
