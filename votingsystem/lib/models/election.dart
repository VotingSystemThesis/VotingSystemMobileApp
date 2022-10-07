import 'dart:ffi';

class Election {
  String? description;
  String? id;
  String? votingStatus;
  String? date;
  String? city;
  bool isActive = false;

  Election(
      {this.description,
      this.votingStatus,
      this.date,
      this.city,
      required this.isActive,
      this.id});

  factory Election.fromJson(Map json) {
    return Election(
        id: json['id'],
        description: json['description'],
        date: json['date'],
        isActive: json['isActive'],
        city: json['city'],
        votingStatus: json['votingStatus']);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'votingStatus': votingStatus,
        'date': date,
        'isActive': isActive
      };
}
