import 'package:flutter/material.dart';
import 'package:votingsystem/utils/utils.dart';
import 'package:votingsystem/views/common/main_background.dart';

import '../../models/candidate.dart';

class CandidateDetails extends StatefulWidget {
  final Candidate candidate;
  const CandidateDetails(this.candidate, {Key? key}) : super(key: key);

  @override
  State<CandidateDetails> createState() => _CandidateDetailsState();
}

class _CandidateDetailsState extends State<CandidateDetails> {
  bool loaded = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return MainBackground(
      useBackButton: true,
      onPress: () {
        Utils.mainNavigator.currentState!.pop();
      },
      distribution: 0.97,
      withPadding: false,
      child: Column(
        children: [
          Container(
            width: screenWidth,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Detalles del candidato",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CircleAvatar(
                  radius: screenWidth * 0.165,
                  backgroundImage: NetworkImage(widget.candidate.imageUrl),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          loaded
              ? Expanded(
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
                          singleRow("Nombre", widget.candidate.name),
                          singleRow(
                              "Nacionalidad", widget.candidate.nationality),
                          singleRow("Edad", widget.candidate.age.toString()),
                          singleRow("Partido Político",
                              widget.candidate.politicalParty),
                          singleRow("Educación", widget.candidate.education),
                        ],
                      ),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Color.fromRGBO(248, 249, 255, 1)),
                    ),
                  ),
                )
              : Expanded(
                  child: SizedBox(
                    width: 350,
                    child: Card(
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 60, bottom: 200),
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
                              "No se pudo cargar detalles",
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
                ),
        ],
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
            children: [candidateDataTitle(title), candidateDataText(text)],
          ),
        ],
      ),
    );
  }

  Widget candidateDataTitle(text) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          overflow: TextOverflow.ellipsis),
    );
  }

  Widget candidateDataText(text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: const TextStyle(overflow: TextOverflow.ellipsis),
    );
  }
}
