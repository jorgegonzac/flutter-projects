import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Thanos snap"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/thanos.png'),
          ),
        ),
      ),
    ),
  );
}
