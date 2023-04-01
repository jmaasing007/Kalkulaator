  import 'package:calculator_maasing/Design/colors.dart';
import 'package:calculator_maasing/Model/historyitem.dart';
  import 'package:flutter/material.dart';
  import 'package:hive_flutter/hive_flutter.dart';



  class History extends StatelessWidget {
    History({Key? key}) : super(key: key);
    final List<HistoryItem> result = Hive.box<HistoryItem>('history')
        .values
        .toList()
        .reversed
        .toList()
        .cast<HistoryItem>();
    Widget appbar(BuildContext context, String title, IconData icon, VoidCallback onPressed) {
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
          duration: const Duration(seconds: 1),
        ),
      );
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: appbar(
            context,
            'History',
            Icons.auto_delete_outlined,
                () {
              Navigator.pop(context);
              Hive.box<HistoryItem>('history').clear();
              showToast(context, 'History cleared successfully');
            },
          ),
        ),
        body: result.isEmpty
            ? Center(
          child: Text(
            'Empty!',
            style: Theme.of(context)
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
              tileColor: yellowColor,
              title: Text(
                result[i].title,
                style: Theme.of(context)
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
  }