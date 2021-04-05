import 'package:flutter/material.dart';
import 'package:gymtimetable/components/calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calendar(),
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.blueGrey,
      ),
    );
  }
}
