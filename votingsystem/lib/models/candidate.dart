import 'dart:convert';

import 'package:votingsystem/models/political_party.dart';

class Candidate {
  final String id;
  final String name;
  final String lastName;
  final String email;
  final String dni;
  final PoliticalParty politicalParty;
  final String birthDate;
  final bool gender;

  Candidate({
    required this.dni,
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.politicalParty,
    required this.birthDate,
    required this.gender,
  });

  static Candidate fromJson(json) {
    return Candidate(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      email: json['email'],
      politicalParty: PoliticalParty.fromJson(json['politicalParty']),
      birthDate: json['birthDate'],
      gender: json['gender'],
      dni: json['dni'],
    );
  }
}
