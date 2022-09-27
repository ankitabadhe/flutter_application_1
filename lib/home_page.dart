import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final int count = 1;
  final String name = "Ankita";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("$name's $count st Flutter App"), //String interpolation
        ),
      ),
      drawer: Drawer(),
    );
  }
}
