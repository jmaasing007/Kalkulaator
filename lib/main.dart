import 'package:calculator_maasing/colors.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: operatorColor,
      body: Column(
        children: [
          Expanded(child: Container(
            width: double.infinity,
              padding: const EdgeInsets.all(12),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text("Input", style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Output", style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                ),),
              SizedBox(
              height: 30,
              ),
              ],
    )
          ),
          ),
          //nuppude ala
          Row(
            children: [
              button(text: "AC", tColor: yellowColor, buttonBgColor: buttonColorChange),
              button(text: "<", buttonBgColor: buttonColorChange, tColor: yellowColor),
              button(text: "", buttonBgColor: Colors.transparent),
              button(text: "/", buttonBgColor: buttonColorChange, tColor: yellowColor),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(text: "x", buttonBgColor: buttonColorChange, tColor: yellowColor),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "-", buttonBgColor: buttonColorChange, tColor: yellowColor),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "+", buttonBgColor: buttonColorChange, tColor: yellowColor),
            ],
          ),
          Row(
            children: [
              button(text: "%", buttonBgColor: buttonColorChange, tColor: yellowColor),
              button(text: "0"),
              button(text: "."),
              button(text: "=", buttonBgColor: yellowColor),
            ],
          ),
        ],

      ),
    );
  }
}
Widget button({
    text, tColor = Colors.white, buttonBgColor = buttonColor
}){
  return Expanded(
    child: Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            ), backgroundColor: buttonColor,
            padding: const EdgeInsets.all(22)
          ),
          onPressed: (){},
          child: Text(text, style: TextStyle(
            fontSize: 18,
            color: tColor,
            fontWeight: FontWeight.bold,
          ),)),
    ),
  );
}