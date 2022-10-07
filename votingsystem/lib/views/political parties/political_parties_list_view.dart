import 'package:flutter/material.dart';
import 'package:votingsystem/core/bloc/electionsBloc.dart';
import 'package:votingsystem/core/provider/userProvider.dart';
import 'package:votingsystem/models/election.dart';
import 'package:votingsystem/views/Voting/select_voting_card.dart';
import 'package:votingsystem/views/political%20parties/single_political_party.dart';

import '../../models/political_party.dart';
import '../common/main_background.dart';

class PoliticalPartiesListView extends StatefulWidget {
  const PoliticalPartiesListView({Key? key}) : super(key: key);

  @override
  State<PoliticalPartiesListView> createState() =>
      _PoliticalPartiesListViewState();
}

class _PoliticalPartiesListViewState extends State<PoliticalPartiesListView> {
  ElectionsBloc electionsBloc = ElectionsBloc();
  List<Election> pastElections = [];
  bool loaded = false;

  @override
  void initState() {
    electionsBloc.getPastElections();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return MainBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Votaciones Pasadas",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                overflow: TextOverflow.ellipsis),
          ),
          Expanded(
            child: buildPoliticalParties(screenWidth, screenHeight),
          )
        ],
      ),
    );
  }

  Widget buildPoliticalParties(screenWidth, screenHeight) {
    return StreamBuilder(
        stream: electionsBloc.electionsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var politicalParties = snapshot.data as List<Election>;
            return ListView.builder(
              itemCount: politicalParties.length,
              itemBuilder: (context, index) {
                return Container(
                  height: screenHeight * 0.25,
                  child: SelectVotingCard(
                    electionsBloc: null,
                    election: politicalParties[index],
                  ),
                );
              },
            );
          } else {
            return Expanded(
              child: SizedBox(
                width: 350,
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 150),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.search,
                          size: 50,
                        ),
                        const Text(
                          "No se encontraron votaciones pasadas",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              loaded = true;
                            });
                          },
                          child: const Text(
                            "Reintentar",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }
}
