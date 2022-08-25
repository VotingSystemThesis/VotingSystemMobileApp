import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  final String text;
  double fontSize;
  FormTitle({Key? key, required this.text, this.fontSize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          overflow: TextOverflow.visible),
    );
  }
}
