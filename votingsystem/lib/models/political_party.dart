class PoliticalParty {
  final int id;
  final String name;
  final String leader;
  final String logo;

  const PoliticalParty({
    required this.id,
    required this.name,
    required this.leader,
    required this.logo,
  });

  static PoliticalParty fromJson(json) => PoliticalParty(
        id: json['id'],
        name: json['name'],
        leader: json['leader'],
        logo: json['logo'],
      );
}
