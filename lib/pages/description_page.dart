import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  final String description;

  DescriptionPage({required this.description});

  // const DescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("desc"),
      ),
      body: Center(child: Text(description)),
    );
  }
}
