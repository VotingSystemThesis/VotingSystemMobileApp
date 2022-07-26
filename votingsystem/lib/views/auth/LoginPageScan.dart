import 'package:biometric_storage/biometric_storage.dart';
import 'package:flutter/material.dart';
import 'package:votingsystem/utils/Utils.dart';
import 'package:votingsystem/views/common/FormButton.dart';
import 'package:votingsystem/views/common/FormTitle.dart';
import 'package:votingsystem/views/common/MainBackground.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class LoginPageScan extends StatefulWidget {
  LoginPageScan({Key? key}) : super(key: key);

  @override
  State<LoginPageScan> createState() => _LoginPageScanState();
}

class _LoginPageScanState extends State<LoginPageScan> {
  final LocalAuthentication auth = LocalAuthentication();

  bool isAuthenticated = false;

  void authenticate() async {
    bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();

    /*final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason:
            'Por favor coloque su huella para continuar con la votación',
        authMessages: <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Oops! Biometric authentication required!',
            cancelButton: 'No thanks',
          ),
          IOSAuthMessages(
            cancelButton: 'No thanks',
          ),
        ],
        options: const AuthenticationOptions(biometricOnly: true),
      );
      final store = BiometricStorage().getStorage('mystorage');

      setState(() {
        isAuthenticated = didAuthenticate;
      });
    }

    if (availableBiometrics.contains(BiometricType.strong) ||
        availableBiometrics.contains(BiometricType.face)) {
      // Specific types of biometrics are available.
      // Use checks like this with caution!
    }*/
    final response = await BiometricStorage().canAuthenticate();
    if (response != CanAuthenticateResponse.success) {
      final store = BiometricStorage().getStorage('mystorage');
    }
  }

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
          onpressed: () {
            authenticate();
          },
          width: screenWidth * 0.8,
          useIcon: true,
          icon: Icons.fingerprint,
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
          icon: Icons.camera_alt_rounded,
        ),
        SizedBox(
          height: 20,
        ),
        isAuthenticated
            ? Text("Se ha autenticado correctamnete")
            : Text("No se ha autenticado")
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
