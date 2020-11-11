import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey.shade700,
        child: Center(
          child: Text(
            'You finally got here!',
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
