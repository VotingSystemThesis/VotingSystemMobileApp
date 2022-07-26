import 'package:flutter/material.dart';
import 'package:votingsystem/router/routes.dart';
import 'package:votingsystem/utils/Utils.dart';
import 'package:votingsystem/views/common/FormButton.dart';
import 'package:votingsystem/views/common/MainBackground.dart';
import 'package:votingsystem/views/common/FormTitle.dart';

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
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                      hintText: 'Ingrese su DNI',
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      labelStyle: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color)),
                ),
              ),
              SizedBox(
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
                  },
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                      hintText: 'dd/mm/yyyy',
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      labelStyle: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color)),
                ),
              ),
              SizedBox(
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
            image: AssetImage("assets/logo.png"),
            width: screenWidth * 0.4,
            height: screenHeight * 0.21,
          ),
          Text(
            "INICIAR SESIÓN",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            elevation: 4,
            child: Container(
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
