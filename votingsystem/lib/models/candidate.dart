class Candidate {
  final int id;
  final String name;
  final String nationality;
  final int age;
  final String politicalParty;
  final String education;
  final String imageUrl;

  const Candidate({
    required this.id,
    required this.name,
    required this.nationality,
    required this.age,
    required this.politicalParty,
    required this.education,
    required this.imageUrl,
  });

  static Candidate fromJson(json) => Candidate(
        id: json['id'],
        name: json['name'],
        nationality: json['nationality'],
        age: json['age'],
        politicalParty: json['politicalParty'],
        education: json['education'],
        imageUrl: json['imageUrl'],
      );
}
