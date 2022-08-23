import 'package:flutter/material.dart';
import 'package:votingsystem/views/Voting/select_voting_card.dart';
//import 'package:votingsystem/views/common/form_title.dart';

class SecondHome extends StatefulWidget {
  const SecondHome({Key? key}) : super(key: key);

  @override
  State<SecondHome> createState() => _SecondHomeState();
}

class _SecondHomeState extends State<SecondHome> {
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
            child: PageView(
              controller: PageController(viewportFraction: 0.95),
              children: const [
                SelectVotingCard(),
                SelectVotingCard(),
                SelectVotingCard()
              ],
            ),
          )
        ],
      ),
    );
  }
}
