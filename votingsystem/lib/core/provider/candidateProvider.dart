import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:votingsystem/models/candidate.dart';

class CandidateProvider {
  final String _url = "http://54.232.15.128/candidate";

  Future<List<Candidate>> getCandidates() async {
    final uri = Uri.parse('$_url');
    final resp = await http.get(uri);
    if (resp.statusCode == 200) {
      List<dynamic> decodedJson = json.decode(resp.body);
      List<Candidate> candidates = decodedJson.map((experienceJson) {
        return Candidate.fromJson(experienceJson);
      }).toList();
      return candidates;
    } else {
      return [];
    }
  }
}
