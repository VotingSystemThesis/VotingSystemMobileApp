import 'package:flutter/foundation.dart';

enum AuthMode { barcode, fingerprint }

class Authentication {
  Future<bool> authenticate(AuthMode mode) async {
    //bool isAuthenticated = false;
    Future.delayed(const Duration(milliseconds: 400));
    if (mode == AuthMode.fingerprint) {
      debugPrint("se auntentica con huella dactilar");
      return true;
    } else {
      debugPrint("Se autentica con codigo de barras");
      return true;
    }
  }
}
