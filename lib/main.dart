// @dart=2.9
import 'package:flutter/material.dart';

import 'pages/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nyong Coffee',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'poppins',
        backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      ),
      home: HomePage(),
    );
  }
}
