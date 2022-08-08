import 'package:flutter/material.dart';

class IconList extends StatelessWidget {
  IconData icon;
  bool isSelected;
  IconList({required this.icon, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: isSelected ? Colors.blue : Colors.black,
      size: 35,
    );
  }
}
