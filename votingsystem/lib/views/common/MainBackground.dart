import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
  Widget child;
  MainBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          width: screenWidth,
          height: screenHeight,
          color: Color.fromRGBO(225, 228, 253, 1),
          child: this.child,
        ),
      ),
    );
  }
}
