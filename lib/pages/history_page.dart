import 'package:flutter/material.dart';
import 'package:nyong_kopi/model/history_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    var history = ListView.builder(
        itemCount: historyList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    historyList[index].menuName,
                    softWrap: true,
                  ),
                  Text('done'),
                ],
              ),
            ),
          );
        });
    return Center(
      child: historyList.isNotEmpty
          ? history
          : Text("You Don't Have Any order Yet."),
    );
  }
}
