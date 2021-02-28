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
  int _i = 0;
  void add() {
    setState(() {
      _i++;
    });
  }

  void sub() {
    setState(() {
      _i--;
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
          Text("Value ${_i}"),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: add,
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: sub,
          )
        ]),
      ),
    );
  }
}
