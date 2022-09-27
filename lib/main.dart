import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //UI work is in the build,call build to refresh UI

    return MaterialApp(
      home: Homepage(),
    );
  }
}
