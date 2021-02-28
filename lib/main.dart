import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _value = '';
  void _change(String value) {
    setState(() {
      _value = "Changed ${value}";
    });
  }

  void _submit(String value) {
    setState(() {
      _value = "Submit ${value}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My First App"),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(children: [
          Text(_value),
          TextField(
            autofocus: true,
            autocorrect: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: "Hint", labelText: "Hello", icon: Icon(Icons.people)),
            onChanged: _change,
            onSubmitted: _submit,
          ),
        ]),
      ),
    );
  }
}
