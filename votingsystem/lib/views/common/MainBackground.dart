import 'package:flutter/material.dart';
import 'package:votingsystem/views/common/FormTitle.dart';

class MainBackground extends StatelessWidget {
  Widget child;
  bool useBackButton;
  double distribution;
  bool withPadding;
  Function? onPress;
  MainBackground(
      {required this.child,
      this.useBackButton = false,
      this.distribution = 0.8,
      this.onPress,
      this.withPadding = true});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: withPadding ? EdgeInsets.all(15) : EdgeInsets.all(0),
            width: screenWidth,
            height: screenHeight,
            color: Color.fromRGBO(225, 228, 253, 1),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (useBackButton)
                  Container(
                    width: screenWidth,
                    height: 30,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: EdgeInsets.all(0),
                          iconSize: 30,
                          onPressed: () {
                            this.onPress!();
                          },
                          icon: Icon(Icons.arrow_back_ios_new),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FormTitle(text: "Volver")
                      ],
                    ),
                  ),
                Container(
                    height: screenHeight * distribution, child: this.child)
              ],
            ))),
      ),
    );
  }
}
