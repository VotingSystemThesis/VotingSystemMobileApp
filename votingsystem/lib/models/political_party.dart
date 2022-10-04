class PoliticalParty {
  final String id;
  final String name;
  final String description;
  final String creationDate;
  final bool status;

  const PoliticalParty(
      {required this.id,
      required this.name,
      required this.description,
      required this.status,
      required this.creationDate});

  static PoliticalParty fromJson(json) => PoliticalParty(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      status: json['status'] ?? false,
      creationDate: json['creationDate']);
}
