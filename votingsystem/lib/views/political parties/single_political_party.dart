import 'package:flutter/material.dart';
import 'package:votingsystem/core/bloc/vote.dart';
import 'package:votingsystem/models/political_party.dart';
import 'package:votingsystem/views/common/form_button.dart';
import 'package:votingsystem/views/common/form_title.dart';

class SinglePoliticalParty extends StatelessWidget {
  final PoliticalParty politicalParty;
  const SinglePoliticalParty(this.politicalParty, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        // showDialog(
        //     context: context,
        //     builder: (ctx) {
        //       return firstPoliticalPartyDialog(screenWidth, screenHeight, ctx);
        //     });
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 3,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          dense: true,
          title: Text(
            politicalParty.description,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(politicalParty.name),
          leading: SizedBox(
            width: 50,
            height: 50,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              // backgroundImage: NetworkImage(politicalParty.logo),
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
}
