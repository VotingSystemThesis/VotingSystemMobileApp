import 'package:votingsystem/model/loginDto.dart';
import 'package:http/http.dart' as http;

class LoginProvier {
  final String _url = "http://54.232.15.128/voter";

  Future<bool> isVoterRegistered(LoginDto loginDto) async {
    final uri = Uri.parse(
        '$_url/dni/${loginDto.dni}/birth/${loginDto.birthDate}/emission/${loginDto.emissionDate}');
    final http.Response resp = await http.post(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (resp.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
