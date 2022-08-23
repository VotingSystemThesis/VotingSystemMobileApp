import 'package:flutter/material.dart';
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
          fontSize: 15,
          overflow: TextOverflow.ellipsis),
    );
  }

  Widget profileDataText(text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: const TextStyle(overflow: TextOverflow.ellipsis),
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

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    //var screenHeight = MediaQuery.of(context).size.height;
    return MainBackground(
      distribution: 0.82,
      withPadding: false,
      child: Column(
        children: [
          Container(
            width: screenWidth,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Perfil",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  radius: screenWidth * 0.165,
                  backgroundImage: const NetworkImage(
                      'https://pps.whatsapp.net/v/t61.24694-24/290134819_987158865306615_8330649461858456400_n.jpg?ccb=11-4&oh=01_AVwC7iGLLZXsSl69Br4ELIA80gscK2lEPUsVbSHeYkzgCg&oe=630BBA31'),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Nombre Apell1 Apell2",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(30),
              elevation: 10,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                width: screenWidth,
                //height: screenHeight * 0.65,
                child: Column(
                  children: [
                    // singleRow("Nombre", "text"),
                    // doubleRow("Apellido Materno", "text1", "Apellido Paterno",
                    //     "text2"),
                    doubleRow("Edad", "text1", "Sexo", "text2"),
                    doubleRow("Nacionalidad", "text1", "Estado Civil", "text2"),
                    doubleRow("Nacimiento", "text1", "Ubigeo", "text2"),
                    singleRow("Dirección", "text"),
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
      ),
    );
  }
}
