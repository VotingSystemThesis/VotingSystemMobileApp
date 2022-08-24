import 'package:flutter/material.dart';
import 'package:votingsystem/views/common/form_title.dart';

import '../../models/political_party.dart';
import '../common/form_button.dart';
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

  Widget singlePoliticalParty(index, screenWidth, screenHeight) {
    var singlePolParty = politicalParties[index];
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (ctx) {
              return Dialog(
                insetPadding: EdgeInsets.all(20),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.45,
                  child: Column(
                    children: [
                      Flexible(
                        child: FormTitle(
                          text: "Confirmación de Voto",
                          fontSize: 28,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Text(
                                "¿Seguro que desea votar por",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                singlePolParty.leader,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          ),
                          Text(
                            " de ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Wrap(
                            children: [
                              Text(
                                singlePolParty.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                "?",
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          )
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RoundedButtonWidget(
                            width: screenWidth * 0.45,
                            buttonText: "VOTAR",
                            height: 50,
                            onpressed: () {},
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Text(
                              "Cancelar",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: const Color.fromRGBO(58, 60, 172, 1)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      },
      child: Card(
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

          // onTap: () {
          //   Navigator.pushNamed(
          //     context,
          //     "/political_party_detail",
          //     arguments: politicalParties[index],
          //   );
          // },
        ),
      ),
    );
  }

  Widget buildPoliticalParties(
      List<PoliticalParty> politicalParties, screenWidth, screenHeight) {
    return ListView.separated(
      itemCount: politicalParties.length,
      itemBuilder: (context, index) {
        return singlePoliticalParty(index, screenWidth, screenHeight);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
