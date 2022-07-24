import 'package:flutter/material.dart';
import 'package:votingsystem/views/common/MainBackground.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Widget loginForm() {
    return Form(
      child: Column(
        children: [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return MainBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/logo.png"),
            width: screenWidth * 0.4,
            height: screenHeight * 0.21,
          ),
          Text(
            "INICIAR SESIÓN",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            elevation: 4,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.4,
              child: loginForm(),
            ),
          )
        ],
      ),
    );
  }
}
