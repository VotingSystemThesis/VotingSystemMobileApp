enum AuthMode { BARCODE, FINGERPRINT }

class Authentication {
  Future<bool> authenticate(AuthMode mode) async {
    bool isAuthenticated = false;
    Future.delayed(Duration(milliseconds: 400));
    if (mode == AuthMode.FINGERPRINT) {
      print("se auntentica con huella dactilar");
      return true;
    } else {
      print("Se autentica con codigo de barras");
      return true;
    }
  }
}
