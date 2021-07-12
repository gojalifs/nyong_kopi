import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  final String description;

  DescriptionPage({required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desc"),
      ),
      body: Center(
          child: SizedBox(
              width: 400,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 2, style: BorderStyle.solid)),
                child: Text(
                  description,
                  softWrap: true,
                  style: TextStyle(fontFamily: 'baloo', fontSize: 30),
                ),
              ))),
    );
  }
}
