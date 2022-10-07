import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:votingsystem/core/bloc/electionsBloc.dart';
import 'package:votingsystem/models/election.dart';
import 'package:votingsystem/router/routes.dart';
import 'package:votingsystem/utils/utils.dart';

class SelectVotingCard extends StatelessWidget {
  Election election;
  ElectionsBloc? electionsBloc;
  bool isClickeable = false;
  SelectVotingCard(
      {required this.election,
      this.isClickeable = false,
      required this.electionsBloc});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        if (isClickeable) {
          Utils.mainNavigator.currentState!
              .pushNamed(routeVotingList, arguments: this.election)
              .then((value) {
            electionsBloc?.getElections();
          });
        }
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://cdn.www.gob.pe/uploads/document/file/2862237/standard_ONPE%20mantiene%20prohibici%C3%B3n%20del%20uso%20de%20celulares%20y%20c%C3%A1maras%20fotogr%C3%A1ficas%20y%20de%20video%20en%20las%20c%C3%A1maras%20secretas.png.png'))),
          margin: const EdgeInsets.all(5),
          width: screenWidth,
          height: screenHeight * 0.4,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.5),
                  Colors.black.withOpacity(.1),
                ])),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Wrap(
                alignment: WrapAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    election.description!,
                    overflow: TextOverflow.clip,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
