  import 'package:calculator_maasing/Model/historyitem.dart';
  import 'package:flutter/material.dart';
  import 'package:hive_flutter/hive_flutter.dart';



  class History extends StatefulWidget {
    const History({Key? key}) : super(key: key);

    @override
    State<History> createState() => _HistoryState();
  }

  class _HistoryState extends State<History> {
    List<HistoryItem> get result => Hive
        .box<HistoryItem>('history')
        .values
        .toList()
        .reversed
        .toList()
        .cast<HistoryItem>();

    get buttonsBackgroundColor => null;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('History'),
        ),
        body: FutureBuilder<Box>(
          future: Hive.openBox('history'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                // Use the historyBox to access data stored in the box
                return const Text('History');
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      );
    }
  }