import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final int day = 2;
  final String name = "Ankita";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          child: Container(
            child: Text("Welcome to $name's $day'nd day Flutter Class"),
          ),
        ),
      ),
    );
  }
}
