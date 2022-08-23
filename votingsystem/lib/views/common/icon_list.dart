import 'package:flutter/material.dart';

class IconList extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  const IconList({
    Key? key,
    required this.icon,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: isSelected ? Colors.blue : Colors.black,
      size: 35,
    );
  }
}
