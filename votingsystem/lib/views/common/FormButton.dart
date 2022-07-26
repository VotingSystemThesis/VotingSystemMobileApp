import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String buttonText;
  final double width;
  final double height;
  final Function onpressed;
  bool useIcon;
  String iconUrl;

  RoundedButtonWidget(
      {required this.buttonText,
      required this.width,
      required this.height,
      required this.onpressed,
      this.useIcon = false,
      this.iconUrl = ''});

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
                  Image(
                    image: AssetImage('assets/' + iconUrl),
                    width: 25,
                    height: 25,
                  )
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
