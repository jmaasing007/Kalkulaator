import 'package:flutter/material.dart';
import 'package:calculator_maasing/Design/colors.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator_maasing/Screen/kmtomiles_screen.dart';
import 'package:calculator_maasing/Screen/history_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';


import '../main.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('History');
  runApp(const MyCalc());
}
class Calculator extends StatefulWidget {
   const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userInput = "";
  String result = "0";
  List<String> buttonList = [
    'AC',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    'C',
    '0',
    '.',
    '=',
  ];
void navigateNextPage(BuildContext ctx)
{
  Navigator.of(ctx).push(MaterialPageRoute(builder: (_)
      {return const KmtomilesScreen();
  }));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: operatorColor,
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: (){
        },),
        title: const Text("Calculator"),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: (){
        },),],
      ),
      body:Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: () {
                    navigateNextPage(context);
                },

                    child: const Text('KMtoMILES>>',
                      style: TextStyle(),
                    )),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const History()));
                },

                    child: const Text('History>>',
                      style: TextStyle(),
                    )),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    userInput,
                    style: const TextStyle(
                      fontSize: 56,
                      color: Colors.white,
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    result,
                    style: const TextStyle(
                      fontSize: 47,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(color: Colors.white),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(30),
                    child: GridView.builder(
                      itemCount: buttonList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,),
                      itemBuilder: (BuildContext context, int index) {
                        return CustomButton(buttonList[index]);
                      },

                    ),
                  ),
                ),
              ],
            ),
          ),



    );
  }

  // ignore: non_constant_identifier_names
  Widget CustomButton(String text) {
    return InkWell(
      splashColor: const Color(0xFF1d2630),
      onTap: () {
        setState(() {
          handleButtons(text);
        });
      },
      child: Ink(
        decoration: BoxDecoration(
          color: getBgColor(text),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 0.5,
              offset: const Offset(-3, -3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: getColor(text),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

    );
  }

  getColor(String text) {
    if (text == "/" ||
        text == "*" ||
        text == "+" ||
        text == "-" ||
        text == "C" ||
        text == "(" ||
        text == "AC" ||
        text == ")") {
      return yellowColor;
    }
    return Colors.white;
  }

  getBgColor(String text) {
    if (text == "=") {
      return yellowColor;
    }
    return const Color(0xFF1d2630);
  }

  handleButtons(String text) {
    if (text == "AC") {
      userInput = "";
      result = "0";
      return;
    }
    if (text == "=") {
      result = calculate();
      userInput = result;
      if (userInput.endsWith(".0")) {
        userInput = userInput.replaceAll(".0", "");
      }
        if (result.endsWith(".0")) {
          result = result.replaceAll(".0", "");
          return;
        }
        else {
          return null;
        }
      }
      userInput = userInput + text;
    }

    String calculate() {
      try {
        var exp = Parser().parse(userInput);
        var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
        return evaluation.toString();
      } catch (e) {
        return "Error";
      }
    }
  }
