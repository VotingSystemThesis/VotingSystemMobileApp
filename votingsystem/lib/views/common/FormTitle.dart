import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  String text;
  FormTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          overflow: TextOverflow.ellipsis),
    );
  }
}
