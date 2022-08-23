import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String buttonText;
  final double width;
  final double height;
  final Function onpressed;
  final bool useIcon;
  final IconData? icon;

  const RoundedButtonWidget(
      {Key? key,
      required this.buttonText,
      required this.width,
      required this.height,
      required this.onpressed,
      this.useIcon = false,
      this.icon})
      : super(key: key);

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
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  Icon(icon)
                ],
              )
            : Text(
                buttonText,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
        style: ElevatedButton.styleFrom(
            elevation: 5,
            primary: const Color.fromRGBO(58, 60, 172, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
