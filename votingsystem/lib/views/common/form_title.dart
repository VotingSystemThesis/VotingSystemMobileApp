import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  final String text;
  const FormTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          overflow: TextOverflow.ellipsis),
    );
  }
}
