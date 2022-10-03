import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:votingsystem/core/bloc/userLoginBloc.dart';
import 'package:votingsystem/models/voter.dart';
import 'package:votingsystem/utils/utils.dart';
//import 'package:votingsystem/views/common/form_title.dart';
import 'package:votingsystem/views/common/main_background.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  Widget profileDataTitle(text) {
    return Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          overflow: TextOverflow.ellipsis),
    );
  }

  Widget profileDataText(text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 18,
      ),
    );
  }

  Widget singleRow(title, text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [profileDataTitle(title), profileDataText(text)],
          ),
        ],
      ),
    );
  }

  Widget doubleRow(title1, text1, title2, text2) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [profileDataTitle(title1), profileDataText(text1)],
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [profileDataTitle(title2), profileDataText(text2)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getAge(String birthDate) {
    var actualDate = DateTime.now();
    var birth = new DateFormat("dd-MM-yyyy").parse(birthDate);

    var dif = actualDate.difference(birth).inDays ~/ 365;

    return dif.toString();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return MainBackground(
      distribution: 1,
      withPadding: false,
      child: FutureBuilder(
          future: UserLoginBloc().getVoterProfile(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var voter = snapshot.data as Voter;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    width: screenWidth,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Perfil",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        CircleAvatar(
                          radius: screenWidth * 0.165,
                          backgroundImage: const NetworkImage(
                              'https://media.discordapp.net/attachments/637114961365041163/1024802988100948059/unknown.png'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          voter.name!,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Material(
                      borderRadius: BorderRadius.circular(30),
                      elevation: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        width: screenWidth,
                        //height: screenHeight * 0.65,
                        child: Column(
                          children: [
                            // singleRow("Nombre", "text"),
                            doubleRow("Apellido", voter.lastName,
                                "Nacionalidad", "Peruano"),
                            doubleRow("Edad", getAge(voter.birthDate!), "Sexo",
                                voter.gender! ? "Masculino" : 'Femenino'),

                            singleRow("Email", voter.email),
                          ],
                        ),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            color: Color.fromRGBO(248, 249, 255, 1)),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Utils().loader(screenWidth, screenHeight);
            }
          }),
    );
  }
}
