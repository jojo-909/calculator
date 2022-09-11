// import 'package:flutter/material.dart';

// String operand1 = '';
// String operand2 = '';
// String operator = '';
// String equation = '';
// String result = '';
// bool equals = false;

// List<String> numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'];
// List<String> operations = ['%', '/', 'X', '-', '+'];

// num? solution(String operator, String operand1, String operand2) {
//   num answer = 0;
//   if (operator.isEmpty || operand1.isEmpty || operand2.isEmpty) {
//     return null;
//   }
//   switch (operator) {
//     case "+":
//       {
//         answer = num.parse(operand1) + num.parse(operand2);
//       }
//       break;
//     case "-":
//       {
//         answer = num.parse(operand1) - num.parse(operand2);
//       }
//       break;
//     case "X":
//       {
//         answer = num.parse(operand1) * num.parse(operand2);
//       }
//       break;
//     case "/":
//       {
//         answer = num.parse(operand1) / num.parse(operand2);
//       }
//       break;
//     case "%":
//       {
//         answer = num.parse(operand1) % num.parse(operand2);
//       }
//       break;
//   }
//   return answer;
// }

// void buttonPress(String value) {
//   if (numbers.contains(value)) {
//     if (operand1.isEmpty) {
//       setState(() {
//         operand1 += value;
//         equation += operand1;
//       });
//       // print(equation);
//     } else if (operand1.isNotEmpty && operator.isEmpty && !equals) {
//       setState(() {
//         operand1 += value;
//         equation += value;
//       });
//       // print(equation);
//     } else if (operand1.isNotEmpty && operator.isNotEmpty && operand2.isEmpty) {
//       setState(() {
//         operand2 += value;
//         equation += ' $value';
//       });
//       // print(equation);
//     } else if (operand1.isNotEmpty &&
//         operator.isNotEmpty &&
//         operand2.isNotEmpty) {
//       setState(() {
//         operand2 += value;
//         equation += value;
//       });
//       // print(equation);
//     } else {
//       return;
//     }
//   } else if (operations.contains(value)) {
//     if (operand1.isEmpty && ['+', '-'].contains(value)) {
//       setState(() {
//         operand1 += value;
//         equation += value;
//       });
//       // print(equation);
//       // print(numb);
//     } else if (operand1.isNotEmpty && operator.isEmpty) {
//       setState(() {
//         operator = value;
//         equation += ' $operator';
//       });
//       // print(equation);
//     } else if (operand1.isNotEmpty && operator.isNotEmpty && operand2.isEmpty) {
//       setState(() {
//         equation.replaceFirst(RegExp(operator), value);
//         operator = value;
//         //rework this!
//       });
//       // print(equation);
//     } else if (operand1.isNotEmpty &&
//         operator.isNotEmpty &&
//         operand2.isNotEmpty) {
//       num answer = solution(operator, operand1, operand2);
//       setState(() {
//         result = answer.toString();
//         operator = value;
//         equation = '$result $operator';
//         operand1 = result;
//         operand2 = '';
//       });
//       // print(equation);
//       // print(result);
//     } else {
//       return;
//     }
//   } else if (value == "=" &&
//       (operand1.isNotEmpty && operator.isNotEmpty && operand2.isNotEmpty)) {
//     num answer = solution(operator, operand1, operand2);
//     setState(() {
//       result = answer.toString();
//       operator = '';
//       operand1 = answer.toString();
//       operand2 = '';
//       equals = true;
//     });
//     equation = operand1;
//     return;
//   } else if (value == "AC") {
//     setState(() {
//       operand1 = '';
//       operand2 = '';
//       operator = '';
//       equation = '';
//       result = '';
//       equals = false;
//     });
//   } else if (value == "DEL") {
//     if (operand2.isNotEmpty) {
//       setState(() {
//         operand2 = operand2.substring(0, operand2.length - 1);
//         equation = "$operand1 $operator $operand2";
//       });
//     } else if (operator.isNotEmpty) {
//       setState(() {
//         operator = '';
//         equation = "$operand1";
//       });
//     } else if (operand1.isNotEmpty) {
//       print('operand1');
//       setState(() {
//         operand1 = operand1.substring(0, operand1.length - 1);
//         equation = "$operand1";
//       });
//       print(operand1);
//     } else {
//       return;
//     }
//   } else {
//     print('not set');
//     return;
//   }
// }

// void buttonPress(String value) {
//   setState(() {
//     if (value == "AC") {
//       operand1 = '';
//       operand2 = '';
//       operator = '';
//       equation = '';
//       result = '';
//       double equationFontSize = 38.0;
//       double resultFontSize = 48.0;
//     } else if (value == "DEL") {
//       if (operand2.isNotEmpty) {
//         operand2 = operand2.substring(0, operand2.length - 1);
//         equation = equation.substring(0, equation.length - 1);
//       } else if (operator.isNotEmpty) {
//         operator = '';
//         equation = equation.substring(0, equation.length - 1);
//       } else if (operand1.isNotEmpty) {
//         operand1 = operand1.substring(0, operand1.length - 1);
//         equation = "$operand1";
//       }
//       double equationFontSize = 48.0;
//       double resultFontSize = 38.0;
//     } else if (value == '=') {
//       double equationFontSize = 38.0;
//       double resultFontSize = 48;
//       num? answer = solution(operator, operand1, operand2);
//       if (answer != null) {
//         operand1 = answer.toString();
//         operand2 = '';
//         operator = '';
//         equation = operand1;
//         result = answer.toString();
//       } else {
//         result = "Error";
//       }
//     } else if (numbers.contains(value)) {
//       double equationFontSize = 48.0;
//       double resultFontSize = 38;
//       if (operand1.isEmpty) {
//         operand1 += value;
//         equation += operand1;
//         // print(equation);
//       } else if (operand1.isNotEmpty && operator.isEmpty) {
//         operand1 += value;
//         equation += value;
//         // print(equation);
//       } else if (operand1.isNotEmpty &&
//           operator.isNotEmpty &&
//           operand2.isEmpty) {
//         operand2 += value;
//         equation += value;
//         // print(equation);
//       } else if (operand1.isNotEmpty &&
//           operator.isNotEmpty &&
//           operand2.isNotEmpty) {
//         operand2 += value;
//         equation += value;
//         // print(equation);
//       } else {
//         print('input issue');
//       }
//     } else if (operations.contains(value)) {
//       double equationFontSize = 48.0;
//       double resultFontSize = 38;
//       if (operand1.isEmpty && ['+', '-'].contains(value)) {
//         operand1 += value;
//         equation += value;
//         // print(equation);
//         // print(numb);
//       } else if (operand1.isNotEmpty && operator.isEmpty) {
//         operator = value;
//         equation += operator;
//         // print(equation);
//       } else if (operand1.isNotEmpty &&
//           operator.isNotEmpty &&
//           operand2.isEmpty) {
//         equation = equation.substring(0, equation.length - 1) + value;
//         operator = value;
//         //rework this!
//         // print(equation);
//       } else if (operand1.isNotEmpty &&
//           operator.isNotEmpty &&
//           operand2.isNotEmpty) {
//         num? answer = solution(operator, operand1, operand2);
//         if (answer != null) {
//           result = answer.toString();
//           operator = value;
//           equation = '$result$operator';
//           operand1 = result;
//         } else {
//           result = "Error";
//         }
//         // print(equation);
//         // print(result);
//       } else {
//         return;
//       }
//     }
//   });
// }



// String equation = "0";
//   String result = "0";
//   String expression = "";
//   double equationFontSize = 38.0;
//   double resultFontSize = 48;

//   void buttonPress(String value) {
//     setState(() {
//       if (value == "AC") {
//         equation = '0';
//         result = '0';
//         double equationFontSize = 38.0;
//         double resultFontSize = 48.0;
//       } else if (value == "DEL") {
//         double equationFontSize = 48.0;
//         double resultFontSize = 38.0;
//         equation = equation.substring(0, equation.length - 1);
//         if (equation == "") {
//           equation = '0';
//         }
//       } else if (value == '=') {
//         double equationFontSize = 38.0;
//         double resultFontSize = 48;

//         expression = equation;
//         expression = expression.replaceAll("×", '*');
//         expression = expression.replaceAll("÷", '/');

//         try {
//           result = expression.interpret().toString();
//           equation = result;
//         } catch (error) {
//           result = "Error";
//         }
//       } else {
//         double equationFontSize = 48.0;
//         double resultFontSize = 38;
//         if (equation == '0') {
//           equation = value;
//         } else {
//           equation += value;
//         }
//       }
//     });
//   }
