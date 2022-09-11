import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final double parentHeight;
  final double parentWidth;
  final String value;
  final Color color;
  final Function press;
  CalcButton({
    required this.parentHeight,
    required this.parentWidth,
    required this.value,
    this.color = Colors.white,
    required this.press,
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final height = parentHeight * 0.18;
    final width = parentWidth * 0.22;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.5), color: Color.fromARGB(255, 53, 52, 52)),
      child: TextButton(
        child: Text(
          value,
          style: TextStyle(color: color, fontSize: 22),
        ),
        onPressed: () {
          return press(value);
        },
      ),
    );
  }
}
