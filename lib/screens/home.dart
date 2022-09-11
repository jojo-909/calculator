import "package:flutter/material.dart";
// import 'dart:math';
import 'package:function_tree/function_tree.dart';

import '../Widgets/calc_button.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String operand1 = '';
  String operand2 = '';
  String operator = '';
  String equation = '';
  String result = '';
  bool equals = false;
  double equationFontSize = 38.0;
  double resultFontSize = 48;

  List<String> numbers = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.'
  ];
  List<String> operations = ['%', "÷", "×", '-', '+'];

  num? solution(String operator, String operand1, String operand2) {
    num answer = 0;
    if (operator.isEmpty || operand1.isEmpty || operand2.isEmpty) {
      return null;
    }
    switch (operator) {
      case "+":
        {
          answer = num.parse(operand1) + num.parse(operand2);
        }
        break;
      case "-":
        {
          answer = num.parse(operand1) - num.parse(operand2);
        }
        break;
      case "×":
        {
          answer = num.parse(operand1) * num.parse(operand2);
        }
        break;
      case "÷":
        {
          answer = num.parse(operand1) / num.parse(operand2);
        }
        break;
      case "%":
        {
          answer = num.parse(operand1) % num.parse(operand2);
        }
        break;
    }
    return answer;
  }

  void buttonPress(String value) {
    setState(() {
      if (value == "AC") {
        operand1 = '';
        operand2 = '';
        operator = '';
        equation = '';
        result = '';
        double equationFontSize = 38.0;
        double resultFontSize = 48.0;
      } else if (value == "DEL") {
        if (operand2.isNotEmpty) {
          operand2 = operand2.substring(0, operand2.length - 1);
          equation = equation.substring(0, equation.length - 1);
        } else if (operator.isNotEmpty) {
          operator = '';
          equation = equation.substring(0, equation.length - 1);
        } else if (operand1.isNotEmpty) {
          operand1 = operand1.substring(0, operand1.length - 1);
          equation = "$operand1";
        }
        double equationFontSize = 48.0;
        double resultFontSize = 38.0;
      } else if (value == '=') {
        double equationFontSize = 38.0;
        double resultFontSize = 48;
        num? answer = solution(operator, operand1, operand2);
        if (answer != null) {
          operand1 = answer.toString();
          operand2 = '';
          operator = '';
          // equation = operand1;
          result = answer.toString();
        } else {
          result = "Error";
        }
      } else if (numbers.contains(value)) {
        double equationFontSize = 48.0;
        double resultFontSize = 38;
        if (operand1.isEmpty) {
          operand1 += value;
          equation += value;
        } else if (operand1.isNotEmpty && operator.isEmpty) {
          operand1 += value;
          equation = operand1;
        } else if (operand1.isNotEmpty &&
            operator.isNotEmpty &&
            operand2.isEmpty) {
          operand2 += value;
          equation += value;
        } else if (operand1.isNotEmpty &&
            operator.isNotEmpty &&
            operand2.isNotEmpty) {
          operand2 += value;
          equation += value;
        } else {
          print('input issue');
        }
      } else if (operations.contains(value)) {
        double equationFontSize = 48.0;
        double resultFontSize = 38;
        if (operand1.isEmpty && ['+', '-'].contains(value)) {
          operand1 += value;
          equation += value;
        } else if (operand1.isNotEmpty && operator.isEmpty) {
          operator = value;
          equation = '$operand1$operator';
        } else if (operand1.isNotEmpty &&
            operator.isNotEmpty &&
            operand2.isEmpty) {
          equation = equation.substring(0, equation.length - 1) + value;
          operator = value;
        } else if (operand1.isNotEmpty &&
            operator.isNotEmpty &&
            operand2.isNotEmpty) {
          num? answer = solution(operator, operand1, operand2);
          if (answer != null) {
            result = answer.toString();
            operator = value;
            operand1 = result;
            operand2 = '';
            equation = '$operand1$operator';
          } else {
            result = "Error";
          }
        } else {
          return;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            height: (size.height - AppBar().preferredSize.height) * 0.1,
            width: double.infinity,
            child: Text(
              equation,
              style: TextStyle(
                fontSize: equationFontSize,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(bottom: 20, right: 20),
            height: (size.height - AppBar().preferredSize.height) * 0.1,
            width: double.infinity,
            child: Text(
              result,
              style: TextStyle(
                fontSize: resultFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
              // height: (size.height - AppBar().preferredSize.height) * 0.5,
              width: size.width,
              height: (size.height - AppBar().preferredSize.height) * 0.6,
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color.fromARGB(255, 66, 66, 66),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: LayoutBuilder(
                builder: ((context, constraints) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcButton(
                            parentHeight: constraints.maxHeight,
                            parentWidth: constraints.maxWidth,
                            value: "AC",
                            color: Color.fromARGB(255, 93, 207, 96),
                            press: buttonPress,
                          ),
                          CalcButton(
                            parentHeight: constraints.maxHeight,
                            parentWidth: constraints.maxWidth,
                            value: "DEL",
                            color: Colors.redAccent,
                            press: buttonPress,
                          ),
                          CalcButton(
                            parentHeight: constraints.maxHeight,
                            parentWidth: constraints.maxWidth,
                            value: "%",
                            color: Colors.redAccent,
                            press: buttonPress,
                          ),
                          CalcButton(
                            parentHeight: constraints.maxHeight,
                            parentWidth: constraints.maxWidth,
                            value: "÷",
                            color: Colors.redAccent,
                            press: buttonPress,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcButton(
                            parentHeight: constraints.maxHeight,
                            parentWidth: constraints.maxWidth,
                            value: "7",
                            press: buttonPress,
                          ),
                          CalcButton(
                              parentHeight: constraints.maxHeight,
                              parentWidth: constraints.maxWidth,
                              value: "8",
                              press: buttonPress),
                          CalcButton(
                            parentHeight: constraints.maxHeight,
                            parentWidth: constraints.maxWidth,
                            value: "9",
                            press: buttonPress,
                          ),
                          CalcButton(
                            parentHeight: constraints.maxHeight,
                            parentWidth: constraints.maxWidth,
                            value: "×",
                            color: Colors.redAccent,
                            press: buttonPress,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcButton(
                            parentHeight: constraints.maxHeight,
                            parentWidth: constraints.maxWidth,
                            value: "4",
                            press: buttonPress,
                          ),
                          CalcButton(
                            parentHeight: constraints.maxHeight,
                            parentWidth: constraints.maxWidth,
                            value: "5",
                            press: buttonPress,
                          ),
                          CalcButton(
                            parentHeight: constraints.maxHeight,
                            parentWidth: constraints.maxWidth,
                            value: "6",
                            press: buttonPress,
                          ),
                          CalcButton(
                              parentHeight: constraints.maxHeight,
                              parentWidth: constraints.maxWidth,
                              value: "-",
                              color: Colors.redAccent,
                              press: buttonPress)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcButton(
                            parentHeight: constraints.maxHeight,
                            parentWidth: constraints.maxWidth,
                            value: "1",
                            press: buttonPress,
                          ),
                          CalcButton(
                            parentHeight: constraints.maxHeight,
                            parentWidth: constraints.maxWidth,
                            value: "2",
                            press: buttonPress,
                          ),
                          CalcButton(
                            parentHeight: constraints.maxHeight,
                            parentWidth: constraints.maxWidth,
                            value: "3",
                            press: buttonPress,
                          ),
                          CalcButton(
                            parentHeight: constraints.maxHeight,
                            parentWidth: constraints.maxWidth,
                            value: "+",
                            color: Colors.redAccent,
                            press: buttonPress,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcButton(
                            parentHeight: constraints.maxHeight,
                            parentWidth: constraints.maxWidth,
                            value: ".",
                            press: buttonPress,
                          ),
                          CalcButton(
                            parentHeight: constraints.maxHeight,
                            parentWidth: constraints.maxWidth,
                            value: "0",
                            press: buttonPress,
                          ),
                          CalcButton(
                            parentHeight: constraints.maxHeight,
                            parentWidth: constraints.maxWidth,
                            value: "00",
                            press: buttonPress,
                          ),
                          CalcButton(
                              parentHeight: constraints.maxHeight,
                              parentWidth: constraints.maxWidth,
                              value: "=",
                              color: Color.fromARGB(255, 93, 207, 96),
                              press: buttonPress)
                        ],
                      ),
                    ],
                  );
                }),
              ))
        ],
      ),
    );
  }
}
