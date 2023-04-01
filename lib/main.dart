import 'package:flutter/material.dart';
import 'Screen/calculator_screen.dart';


void main(){
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
