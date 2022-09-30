import 'package:votingsystem/model/loginDto.dart';
import 'package:http/http.dart' as http;

class LoginProvier {
  final String _url = "http://54.232.15.128/voter";

  Future<bool> isVoterRegistered(LoginDto loginDto) async {
    final uri = Uri.parse(
        '$_url/dni/${loginDto.dni}/birth/${loginDto.birthDate}/emission/${loginDto.emissionDate}');
    // final resp = await http.post(uri, headers: <String, String>{
    //   'Content-Type': 'application/json; charset=UTF-8',
    // });
    final resp = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    print(resp);
    if (resp.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
