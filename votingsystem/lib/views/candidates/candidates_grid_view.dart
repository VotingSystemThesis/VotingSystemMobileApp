import 'package:flutter/material.dart';
import 'package:votingsystem/core/provider/candidateProvider.dart';
import 'package:votingsystem/models/candidate.dart';
import 'package:votingsystem/router/routes.dart';
import 'package:votingsystem/utils/utils.dart';
import 'package:votingsystem/views/common/main_background.dart';

class CandidatesGridView extends StatefulWidget {
  const CandidatesGridView({Key? key}) : super(key: key);

  @override
  State<CandidatesGridView> createState() => _CandidatesGridViewState();
}

class _CandidatesGridViewState extends State<CandidatesGridView> {
  bool loaded = false;
  @override
  Widget build(BuildContext context) {
    return MainBackground(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Lista de Candidatos",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              overflow: TextOverflow.ellipsis),
        ),
        Expanded(
          child: FutureBuilder(
              future: CandidateProvider().getCandidates(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? buildCandidates(snapshot.data as List<Candidate>)
                    : Expanded(
                        child: SizedBox(
                          width: 350,
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 150),
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
                                    "No se encontraron candidatos",
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
              }),
        )
      ],
    ));
  }

  Widget buildCandidates(List<Candidate> candidates) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: candidates.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Utils.mainNavigator.currentState!
                .pushNamed(routeCandidateDetails, arguments: candidates[index]);
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        'https://media.discordapp.net/attachments/637114961365041163/1024802988100948059/unknown.png'),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      candidates[index].name,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
