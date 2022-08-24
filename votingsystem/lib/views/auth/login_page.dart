import 'package:flutter/material.dart';
import 'package:votingsystem/router/routes.dart';
import 'package:votingsystem/utils/utils.dart';
import 'package:votingsystem/views/common/form_button.dart';
import 'package:votingsystem/views/common/main_background.dart';
import 'package:votingsystem/views/common/form_title.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Widget loginForm(context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormTitle(
                text: "DNI",
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontWeight: FontWeight.bold),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {},
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Ingrese su DNI";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                      ),
                      hintText: 'Ingrese su DNI',
                      hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                      labelStyle: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FormTitle(
                text: "Fecha de emisión",
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyText1!.color),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {},
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Ingrese la fecha de emisión del DNI";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
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
                      hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                      labelStyle: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RoundedButtonWidget(
                onpressed: () {
                  Utils.mainNavigator.currentState!
                      .pushNamed(routeLoginViewScan);
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
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return MainBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage("assets/logo.png"),
            width: screenWidth * 0.4,
            height: screenHeight * 0.21,
          ),
          const Text(
            "INICIAR SESIÓN",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
              height: screenHeight * 0.37,
              child: loginForm(context),
            ),
          )
        ],
      ),
    );
  }
}
