import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String buttonText;
  final double width;
  final double height;
  final Function onpressed;
  bool useIcon;
  IconData? icon;

  RoundedButtonWidget(
      {required this.buttonText,
      required this.width,
      required this.height,
      required this.onpressed,
      this.useIcon = false,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          onpressed();
        },
        child: useIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(buttonText,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Icon(this.icon)
                ],
              )
            : Text(
                buttonText,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
        style: ElevatedButton.styleFrom(
            elevation: 5,
            primary: Color.fromRGBO(58, 60, 172, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
