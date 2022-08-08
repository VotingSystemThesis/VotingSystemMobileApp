import 'package:biometric_storage/biometric_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:votingsystem/core/bloc/Authentication.dart';
import 'package:votingsystem/router/routes.dart';
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

class _LoginPageScanState extends State<LoginPageScan>
    with TickerProviderStateMixin {
  final LocalAuthentication auth = LocalAuthentication();
  String barcode = '';
  bool isAuthenticated = false;
  Authentication authController = Authentication();
  var sizeforicon = 0;
  late AnimationController _controller;
  late Animation<double> size;
  late Animation<double> opacity;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.ease,
        ),
      ),
    );

    size = Tween<double>(
      begin: 0.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.2,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were dispsedo
    }
  }

  void authenticateFingerprint() async {
    bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();

    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason:
            'Por favor coloque su huella para continuar con la votación',
        authMessages: <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Se requiere su huella dactilar',
            cancelButton: 'Cancelar',
          ),
          IOSAuthMessages(
            cancelButton: 'Cancelar',
          ),
        ],
        options: const AuthenticationOptions(biometricOnly: true),
      );

      var resposne = await authController.authenticate(AuthMode.FINGERPRINT);
      setState(() {
        isAuthenticated = resposne;
      });
      if (isAuthenticated) {
        _playAnimation();
        await Future.delayed(Duration(seconds: 2));
        Utils.mainNavigator.currentState!.pushReplacementNamed(routeHome);
      }
    }
  }

  void authenticateBarcode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);

      authController.authenticate(AuthMode.BARCODE).then((value) {
        setState(() {
          isAuthenticated = value;
        });
      });
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (isAuthenticated) {
      _playAnimation();
      await Future.delayed(Duration(seconds: 2));
      Utils.mainNavigator.currentState!.pushReplacementNamed(routeHome);
    }
  }

  Widget loginButtons(screenWidth, screenHeight) {
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
          onpressed: () async {
            authenticateFingerprint();
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
          onpressed: () {
            authenticateBarcode();
          },
          width: screenWidth * 0.8,
          useIcon: true,
          icon: Icons.camera_alt_rounded,
        ),
      ],
    );
  }

  Widget loginPageScanBody(screenWidth, screenHeight) {
    return Stack(
      alignment: Alignment.center,
      children: [
        loginButtons(screenWidth, screenHeight),
        AnimatedBuilder(
            animation: _controller,
            builder: (ctx, child) {
              return _buildAnimation(screenWidth, screenHeight);
            })
      ],
    );
  }

  Widget _buildAnimation(screenWidth, screenHeight) {
    return IgnorePointer(
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: screenWidth,
          height: screenHeight * 0.4,
          child: Icon(
            Icons.check,
            size: size.value,
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
        ),
      ),
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
