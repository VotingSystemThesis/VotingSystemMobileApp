import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../models/political_party.dart';
import '../common/MainBackground.dart';

class PoliticalPartiesListView extends StatelessWidget {
  PoliticalPartiesListView({Key? key}) : super(key: key);

  List<PoliticalParty> politicalParties = getPoliticalParties();

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
  Widget build(BuildContext context) {
    return MainBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Partidos Políticos",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                overflow: TextOverflow.ellipsis),
          ),
          Expanded(
            child: buildPoliticalParties(politicalParties),
          ),
        ],
      ),
    );
  }

  Widget buildPoliticalParties(List<PoliticalParty> politicalParties) {
    return ListView.separated(
      itemCount: politicalParties.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 3,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            dense: true,
            title: Text(
              politicalParties[index].leader.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Text(politicalParties[index].name),
            leading: SizedBox(
              width: 50,
              height: 50,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(politicalParties[index].logo),
              ),
            ),
            trailing: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            // onTap: () {
            //   Navigator.pushNamed(
            //     context,
            //     "/political_party_detail",
            //     arguments: politicalParties[index],
            //   );
            // },
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
