import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:votingsystem/models/election.dart';
import 'package:votingsystem/models/loginDto.dart';
import 'package:votingsystem/models/voter.dart';

class UserProvider {
  final String _url = "http://54.232.15.128/voter";

  Future<Voter?> isVoterRegistered(LoginDto loginDto) async {
    final uri = Uri.parse(
        '$_url/dni/${loginDto.dni}/birth/${loginDto.birthDate}/emission/${loginDto.emissionDate}');
    // final resp = await http.post(uri, headers: <String, String>{
    //   'Content-Type': 'application/json; charset=UTF-8',
    // });
    final resp = await http.get(uri);
    if (resp.statusCode == 200) {
      Voter verfiedVoter = Voter.fromJson(jsonDecode(resp.body));
      return verfiedVoter;
    } else {
      Future.error('NotVerified');
    }
  }

  Future<Voter?> getVoterById(String id) async {
    final uri = Uri.parse('$_url/${id}');
    final resp = await http.get(uri);
    if (resp.statusCode == 200) {
      Voter verfiedVoter = Voter.fromJson(jsonDecode(resp.body));
      return verfiedVoter;
    } else {
      Future.error('NotVerified');
    }
  }

  Future<List<Election>> getPendingElections(
      String city, String votanteId) async {
    final prefs = await SharedPreferences.getInstance();

    final uri =
        Uri.parse('$_url/voting/city/${city}/status/PENDING/voter/$votanteId');
    final resp = await http.get(uri);
    if (resp.statusCode == 200) {
      List<dynamic> decodedJson = json.decode(resp.body);
      List<Election> elections = decodedJson.map((experienceJson) {
        return Election.fromJson(experienceJson);
      }).toList();
      return elections;
    } else {
      return [];
    }
  }

  Future<List<Election>> getPastElections(String city, String votanteId) async {
    final prefs = await SharedPreferences.getInstance();

    final uri = Uri.parse(
        '$_url/voting/city/${city}/status/COMPLETED/voter/$votanteId');
    final resp = await http.get(uri);
    if (resp.statusCode == 200) {
      List<dynamic> decodedJson = json.decode(resp.body);
      List<Election> elections = decodedJson.map((experienceJson) {
        return Election.fromJson(experienceJson);
      }).toList();
      return elections;
    } else {
      return [];
    }
  }
}
