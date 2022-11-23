import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:votingsystem/core/bloc/vote.dart';
import 'package:votingsystem/core/provider/candidateProvider.dart';
import 'package:votingsystem/models/candidate.dart';
import 'package:votingsystem/models/election.dart';
import 'package:votingsystem/utils/utils.dart';
import 'package:votingsystem/views/common/form_button.dart';
import 'package:votingsystem/views/common/form_title.dart';
import 'package:votingsystem/views/common/main_background.dart';

class VotingList extends StatefulWidget {
  VotingList({Key? key}) : super(key: key);

  @override
  State<VotingList> createState() => _VotingListState();
}

class _VotingListState extends State<VotingList> {
  Widget firstPoliticalPartyDialog(
      screenWidth, screenHeight, ctx, Candidate candidate, Election elect) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(10),
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
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    const Text(
                      "¿Seguro que desea votar por",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      candidate.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                const Text(
                  " de ",
                  style: TextStyle(fontSize: 18),
                ),
                Wrap(
                  children: [
                    Text(
                      candidate.politicalParty.description,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Text(
                      "?",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                )
              ],
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RoundedButtonWidget(
                  width: screenWidth * 0.45,
                  buttonText: "VOTAR",
                  height: 50,
                  onpressed: () async {
                    var response = await VoteBloc().vote(candidate, elect);
                    if (response.isNotEmpty) {
                      showDialog(
                          context: ctx,
                          builder: (successctx) {
                            return successDialog(screenWidth, screenHeight,
                                successctx, ctx, response);
                          }).then((value) {
                        Utils.mainNavigator.currentState!.pop();
                      });
                    } else {
                      showDialog(
                          context: ctx,
                          builder: (errorctx) {
                            return errorDialog(
                                screenWidth, screenHeight, errorctx);
                          });
                    }
                  },
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(58, 60, 172, 1)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget successDialog(screenWidth, screenHeight, successctx, ctx, response) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: screenWidth * 0.85,
        height: screenHeight * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormTitle(
              text: "Voto Confirmado",
              fontSize: 28,
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
                height: screenHeight * 0.22,
                child: Center(
                  child: QrImage(
                    data: response,
                    version: QrVersions.auto,
                    size: 170.0,
                  ),
                )),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {
                Navigator.of(ctx).pop();
                Navigator.of(successctx).pop();
              },
              child: const Text(
                "Regresar",
                style: TextStyle(
                    fontSize: 20, color: Color.fromRGBO(58, 60, 172, 1)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget errorDialog(screenWidth, screenHeight, errorctx) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: screenWidth * 0.85,
        height: screenHeight * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormTitle(
              text: "Voto no confirmado",
              fontSize: 28,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                    height: screenHeight * 0.2,
                    child: const Image(
                      image: AssetImage('assets/cancelIcon.png'),
                    )),
                const Flexible(
                    child:
                        Text("Ha ocurrido un error en el registro de su voto"))
              ],
            ),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {
                Navigator.of(errorctx).pop();
              },
              child: const Text(
                "Regresar",
                style: TextStyle(
                    fontSize: 20, color: Color.fromRGBO(58, 60, 172, 1)),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final elect = ModalRoute.of(context)!.settings.arguments as Election;
    return MainBackground(
        onPress: () {
          Utils.mainNavigator.currentState!.pop();
        },
        useBackButton: true,
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
                  future:
                      CandidateProvider().getCandidatesByElection(elect.id!),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? buildCandidates(snapshot.data as List<Candidate>,
                            screenWidth, screenHeight, elect)
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
                                            // loaded = true;
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

  Widget buildCandidates(
      List<Candidate> candidates, screenWidth, screenHeight, elect) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: candidates.length,
      itemBuilder: (gridContext, index) {
        return GestureDetector(
          onTap: () {
            showDialog(
                context: gridContext,
                builder: (dialogContext) {
                  return firstPoliticalPartyDialog(screenWidth, screenHeight,
                      dialogContext, candidates[index], elect);
                });
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
