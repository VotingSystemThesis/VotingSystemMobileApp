import 'dart:async';

import 'package:rxdart/rxdart.dart';

class UserLoginBloc {
  final _birthdayController = BehaviorSubject<String>();
  Stream<String> get birthdayStream =>
      _birthdayController.stream.transform(validateBirthday);
  Function(String) get changeBirthday => _birthdayController.sink.add;
  Sink<String> get sinkBirthday => _birthdayController.sink;

  String get getBirthday => _birthdayController.value;

  final _emissionDateController = BehaviorSubject<String>();
  Stream<String> get emissionDateStream => _emissionDateController.stream;
  Function(String) get changeEmissionDate => _emissionDateController.sink.add;
  Sink<String> get sinkEmissionDate => _emissionDateController.sink;

  final _dniController = BehaviorSubject<String>();
  Stream<String> get dniStream => _dniController.stream.transform(validateDni);
  Function(String) get changeDNI => _dniController.sink.add;
  Sink<String> get sinkDNI => _dniController.sink;

  String get getEmissionDate => _birthdayController.value;

  final validateBirthday =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.length != 1) {
      hasEnoughAge(value)
          ? sink.add(value)
          : sink.addError('Debe ser mayor de 18 años');
    }
  });

  final validateDni =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.length != 1) {
      isNumberOnly(value) && value.length < 9
          ? sink.add(value)
          : sink.addError('Ingrese un DNI correcto');
    }
  });

  static bool isNumberOnly(String name) {
    String value = r"^[0-9]*$";

    RegExp regExp = RegExp(value);
    return regExp.hasMatch(name) && name.length < 9;
  }

  static bool hasEnoughAge(String date) {
    DateTime birthDay = DateTime.parse(date);
    DateTime today = DateTime.now();

    int totalDays = today.difference(birthDay).inDays;

    int years = totalDays ~/ 365;

    return years > 18;
  }
}
