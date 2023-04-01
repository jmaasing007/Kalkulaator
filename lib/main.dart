import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Screen/calculator_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('History');
  runApp(const MyCalc());
}

class MyCalc extends StatelessWidget {
  const MyCalc({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}
