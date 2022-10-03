import 'package:flutter/material.dart';
import 'package:votingsystem/core/bloc/electionsBloc.dart';
import 'package:votingsystem/core/bloc/userLoginBloc.dart';
import 'package:votingsystem/models/election.dart';
import 'package:votingsystem/utils/utils.dart';
import 'package:votingsystem/views/Voting/select_voting_card.dart';
//import 'package:votingsystem/views/common/form_title.dart';

class SecondHome extends StatefulWidget {
  const SecondHome({Key? key}) : super(key: key);

  @override
  State<SecondHome> createState() => _SecondHomeState();
}

class _SecondHomeState extends State<SecondHome> {
  ElectionsBloc electionsBloc = ElectionsBloc();

  @override
  void initState() {
    electionsBloc.getElections();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Bienvenido",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Seleccione la opción el cual desea realizar su voto",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
              width: screenWidth,
              height: screenHeight * 0.3,
              child: StreamBuilder(
                  stream: electionsBloc.electionsStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Election> elections =
                          snapshot.data as List<Election>;
                      return elections.length > 0
                          ? PageView.builder(
                              controller:
                                  PageController(viewportFraction: 0.95),
                              itemCount: elections.length,
                              itemBuilder: (context, index) {
                                return SelectVotingCard(elections[index]);
                              },
                            )
                          : Center(
                              child: Text(
                                  "Usted no cuenta con una votacion disponible"));
                    } else {
                      return Container(
                        child: Utils().loader(screenWidth, screenHeight * 0.3),
                      );
                    }
                  }))
        ],
      ),
    );
  }
}
