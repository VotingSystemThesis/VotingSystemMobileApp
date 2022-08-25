import 'package:flutter/material.dart';
import 'package:votingsystem/views/political%20parties/single_political_party.dart';

import '../../models/political_party.dart';
import '../common/main_background.dart';

class PoliticalPartiesListView extends StatefulWidget {
  const PoliticalPartiesListView({Key? key}) : super(key: key);

  static List<PoliticalParty> getPoliticalParties() {
    const data = [
      {
        "id": 1,
        "name": "Fuerza Popular",
        "leader": "Keiko Fujimori",
        "logo":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Fuerza_popular.svg/1200px-Fuerza_popular.svg.png",
      },
      {
        "id": 2,
        "name": "Alianza para el progreso",
        "leader": "Cesar Acuña Peralta",
        "logo":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Alianza_para_el_Progreso_Peru.svg/1200px-Alianza_para_el_Progreso_Peru.svg.png",
      },
      {
        "id": 3,
        "name": "Frente Esperanza",
        "leader": "Fernando Olivera",
        "logo":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Frente_de_la_Esperanza_2021_%28logo%29.svg/797px-Frente_de_la_Esperanza_2021_%28logo%29.svg.png",
      },
      {
        "id": 4,
        "name": "APRA",
        "leader": "Alan García",
        "logo":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/APRA_Peru_logo.svg/900px-APRA_Peru_logo.svg.png",
      },
      {
        "id": 5,
        "name": "Perú Nación",
        "leader": "Francisco Diez",
        "logo":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Logo_Peru_nacion.svg/767px-Logo_Peru_nacion.svg.png",
      },
    ];

    return data.map<PoliticalParty>(PoliticalParty.fromJson).toList();
  }

  @override
  State<PoliticalPartiesListView> createState() =>
      _PoliticalPartiesListViewState();
}

class _PoliticalPartiesListViewState extends State<PoliticalPartiesListView> {
  List<PoliticalParty> politicalParties =
      PoliticalPartiesListView.getPoliticalParties();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return MainBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Partidos Políticos",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                overflow: TextOverflow.ellipsis),
          ),
          Expanded(
            child: buildPoliticalParties(
                politicalParties, screenWidth, screenHeight),
          ),
        ],
      ),
    );
  }

  Widget buildPoliticalParties(
      List<PoliticalParty> politicalParties, screenWidth, screenHeight) {
    return ListView.builder(
      itemCount: politicalParties.length,
      itemBuilder: (context, index) {
        return SinglePoliticalParty(politicalParties[index]);
      },
    );
  }
}
