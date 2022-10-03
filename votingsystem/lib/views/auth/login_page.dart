import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:votingsystem/core/bloc/userLoginBloc.dart';
import 'package:votingsystem/models/loginDto.dart';
import 'package:votingsystem/router/routes.dart';
import 'package:votingsystem/utils/utils.dart';
import 'package:votingsystem/views/common/form_button.dart';
import 'package:votingsystem/views/common/main_background.dart';
import 'package:votingsystem/views/common/form_title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserLoginBloc userProfileBloc = UserLoginBloc();
  TextEditingController _birthdateController = TextEditingController();
  TextEditingController _emissiondateController = TextEditingController();
  LoginDto loginDto = new LoginDto();
  final _loginFormKey = GlobalKey<FormState>();

  bool errorBirthday = false;
  bool errorDni = false;
  bool errorEmissionDate = false;

  _saveForm() async {
    if (this._loginFormKey.currentState!.validate()) {
      this._loginFormKey.currentState!.save();
      userProfileBloc.isVoterRegistered(loginDto, context);
    }
  }

  Widget loginForm(context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: SingleChildScrollView(
        child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormTitle(
                text: "DNI",
              ),
              StreamBuilder(
                stream: userProfileBloc.dniStream,
                builder: (ctx, snapshot) {
                  return TextFormField(
                    onChanged: (val) {
                      userProfileBloc.sinkDNI.add(val);
                    },
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                    textInputAction: TextInputAction.next,
                    onSaved: (value) {
                      loginDto.dni = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Ingrese su DNI";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                        ),
                        hintText: 'Ingrese su DNI',
                        hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyText1!.color)),
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              FormTitle(
                text: "Fecha de nacimiento",
              ),
              StreamBuilder(
                  stream: userProfileBloc.birthdayStream,
                  builder: (context, snapshot) {
                    return TextFormField(
                      controller: _birthdateController,
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: snapshot.hasData
                                    ? DateTime.parse(snapshot.data.toString())
                                    : DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100))
                            .then((date) {
                          String dateFormat =
                              "${date!.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

                          _birthdateController.text = DateFormat("dd-MM-yyyy")
                              .format(DateTime.parse(dateFormat));

                          userProfileBloc.changeBirthday(dateFormat);
                        });
                      },
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color),
                      textInputAction: TextInputAction.next,
                      onSaved: (value) {
                        loginDto.birthDate = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Ingrese la fecha de nacimiento del DNI";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          suffixIcon: const Icon(
                            Icons.calendar_today,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                          ),
                          hintText: 'dd/mm/yyyy',
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          labelStyle: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color)),
                    );
                  }),
              const SizedBox(
                height: 15,
              ),
              FormTitle(
                text: "Fecha de emisión",
              ),
              StreamBuilder(
                  stream: userProfileBloc.emissionDateStream,
                  builder: (context, snapshot) {
                    return TextFormField(
                      controller: _emissiondateController,
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: snapshot.hasData
                                    ? DateTime.parse(snapshot.data.toString())
                                    : DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100))
                            .then((date) {
                          String dateFormat =
                              "${date!.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

                          _emissiondateController.text =
                              DateFormat("dd-MM-yyyy")
                                  .format(DateTime.parse(dateFormat));

                          userProfileBloc.changeEmissionDate(dateFormat);
                        });
                      },
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color),
                      textInputAction: TextInputAction.next,
                      onSaved: (value) {
                        loginDto.emissionDate = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Ingrese la fecha de nacimiento del DNI";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          suffixIcon: const Icon(
                            Icons.calendar_today,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                          ),
                          hintText: 'dd/mm/yyyy',
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          labelStyle: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color)),
                    );
                  }),
              const SizedBox(
                height: 15,
              ),
              RoundedButtonWidget(
                onpressed: () {
                  if (!errorBirthday && !errorDni && !errorEmissionDate)
                    _saveForm();
                },
                buttonText: "SIGUIENTE",
                width: double.infinity,
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    userProfileBloc.dniStream.listen((event) {
      errorDni = false;
    }).onError((a) {
      errorDni = true;
    });

    userProfileBloc.birthdayStream.listen((event) {
      errorBirthday = false;
    }).onError((a) {
      errorBirthday = true;
    });

    userProfileBloc.emissionDateStream.listen((event) {
      errorEmissionDate = false;
    }).onError((a) {
      errorEmissionDate = true;
    });

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return MainBackground(
      distribution: 0.95,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage("assets/logo.png"),
            width: screenWidth * 0.4,
            height: screenHeight * 0.15,
          ),
          const Text(
            "INICIAR SESIÓN",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            elevation: 4,
            child: SizedBox(
              width: screenWidth,
              height: screenHeight * 0.55,
              child: loginForm(context),
            ),
          )
        ],
      ),
    );
  }
}
