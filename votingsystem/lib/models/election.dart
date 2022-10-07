import 'dart:ffi';

class Election {
  String? description;
  String? id;
  String? votingStatus;
  String? date;
  bool isActive = false;

  Election(
      {this.description,
      this.votingStatus,
      this.date,
      required this.isActive,
      this.id});

  factory Election.fromJson(Map json) {
    return Election(
        id: json['id'],
        description: json['description'],
        date: json['date'],
        isActive: json['isActive'],
        votingStatus: json['votingStatus']);
  }
}
