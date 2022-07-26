import 'package:flutter/material.dart';
import 'package:votingsystem/utils/Utils.dart';
import 'package:votingsystem/views/common/FormButton.dart';
import 'package:votingsystem/views/common/FormTitle.dart';
import 'package:votingsystem/views/common/MainBackground.dart';

class LoginPageScan extends StatefulWidget {
  LoginPageScan({Key? key}) : super(key: key);

  @override
  State<LoginPageScan> createState() => _LoginPageScanState();
}

class _LoginPageScanState extends State<LoginPageScan> {
  Widget loginPageScanBody(screenWidth, screenHeight) {
    return Column(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 4,
          child: Container(
            width: screenWidth * 0.8,
            height: screenHeight * 0.08,
            child: Center(
              child: FormTitle(
                text: "Verifica tus datos",
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        RoundedButtonWidget(
          buttonText: "HUELLA DACTILAR",
          height: 50,
          onpressed: () {},
          width: screenWidth * 0.8,
          useIcon: true,
          iconUrl: 'huellaicon.png',
        ),
        SizedBox(
          height: 10,
        ),
        FormTitle(text: "O"),
        SizedBox(
          height: 10,
        ),
        RoundedButtonWidget(
          buttonText: "CODIGO DE BARRAS",
          height: 50,
          onpressed: () {},
          width: screenWidth * 0.8,
          useIcon: true,
          iconUrl: 'camaraicon.png',
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return MainBackground(
      useBackButton: true,
      onPress: () {
        Utils.mainNavigator.currentState!.pop();
      },
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
          loginPageScanBody(screenWidth, screenHeight)
        ],
      ),
    );
  }
}
