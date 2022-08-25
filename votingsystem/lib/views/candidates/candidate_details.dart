import 'package:flutter/material.dart';
import 'package:votingsystem/views/common/main_background.dart';

import '../../models/candidate.dart';

class CandidateDetails extends StatelessWidget {
  final Candidate candidate;
  const CandidateDetails(this.candidate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return MainBackground(
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
                  backgroundImage: NetworkImage(candidate.imageUrl),
                ),
                const SizedBox(
                  height: 15,
                ),
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
                    singleRow("Nombre", candidate.name),
                    singleRow("Nacionalidad", candidate.nationality),
                    singleRow("Edad", candidate.age.toString()),
                    singleRow("Partido Político", candidate.politicalParty),
                    singleRow("Educación", candidate.education),
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
