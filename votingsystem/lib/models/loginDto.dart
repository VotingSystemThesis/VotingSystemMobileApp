class LoginDto {
  String? dni;
  String? emissionDate;
  String? birthDate;

  LoginDto({
    this.dni,
    this.emissionDate,
    this.birthDate,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) {
    return LoginDto(
        dni: json["dni"],
        emissionDate: json["emissionDate"],
        birthDate: json["birthDate"]);
  }
  Map<String, dynamic> ToJson(LoginDto loginDto) {
    return {
      'dni': loginDto.dni,
      'birth': loginDto.birthDate,
      'emission': loginDto.emissionDate,
    };
  }
}
