import 'package:calculator_maasing/Model/historyitem.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart' show Hive;



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
      appBar: appbar(
        context,
        'History',
        Icons.auto_delete_outlined,
            () {
          Navigator.pop(context);
          Hive.box<HistoryItem>('history').clear();
          showToast(context, 'History cleared successfully');
        },
      ),
      body: result.isEmpty
          ? Center(
        child: Text(
          'Empty!',
          style: Theme
              .of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontSize: 12.0),
        ),
      )
          : ListView.separated(
        padding: const EdgeInsets.all(10.0),
        itemCount: result.length,
        separatorBuilder: (BuildContext context, int index) =>
        const SizedBox(height: 10),
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            tileColor: buttonsBackgroundColor,
            title: Text(
              result[i].title,
              style: Theme
                  .of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: 26.0),
            ),
            subtitle: Text(result[i].subtitle),
          );
        },
      ),
    );
  }

  AppBar appbar(BuildContext context, String title, IconData icon,
      Function() onPressed) {
    return AppBar(
      title: Text(title),
      leading: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }

  void showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
