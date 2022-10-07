class Voter {
  String? name;
  String? id;
  String? lastName;
  String? dni;
  bool? gender;
  String? birthDate;
  String? emissionDate;
  String? city;
  String? group;
  String? email;

  Voter(
      {this.name,
      this.id,
      this.lastName,
      this.dni,
      this.gender,
      this.birthDate,
      this.emissionDate,
      this.city,
      this.group,
      this.email});

  factory Voter.fromJson(Map json) {
    return Voter(
        id: json['id'],
        dni: json['dni'],
        lastName: json['lastName'],
        city: json['city'],
        birthDate: json['birthDate'],
        emissionDate: json['emissionDate'],
        group: json['group'],
        email: json['email'],
        name: json['name'],
        gender: json['gender']);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'lastName': lastName,
        'email': email,
        'dni': dni,
        'gender': gender,
        'emissionDate': emissionDate,
        'birthDate': birthDate,
        'city': city,
        'group': group
      };
}
