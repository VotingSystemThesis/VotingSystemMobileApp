import 'package:flutter/material.dart';
import 'package:votingsystem/core/bloc/vote.dart';
import 'package:votingsystem/models/political_party.dart';
import 'package:votingsystem/views/common/form_button.dart';
import 'package:votingsystem/views/common/form_title.dart';

class SinglePoliticalParty extends StatelessWidget {
  PoliticalParty politicalParty;
  SinglePoliticalParty(this.politicalParty);

  Widget firstPoliticalPartyDialog(screenWidth, screenHeight, ctx) {
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
                      politicalParty.leader,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                      politicalParty.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                  onpressed: () async {
                    var response = await VoteBloc().vote();
                    if (response) {
                      showDialog(
                          context: ctx,
                          builder: (successctx) {
                            return successDialog(
                                screenWidth, screenHeight, successctx);
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
  }

  Widget successDialog(screenWidth, screenHeight, successctx) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        width: screenWidth * 0.85,
        height: screenHeight * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormTitle(
              text: "Voto Confirmado",
              fontSize: 28,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                height: screenHeight * 0.2,
                child: Image(
                  image: AssetImage('assets/correctIcon.png'),
                )),
            Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {
                Navigator.of(successctx).pop();
              },
              child: Text(
                "Regresar",
                style: TextStyle(
                    fontSize: 20, color: const Color.fromRGBO(58, 60, 172, 1)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget errorDialog(screenWidth, screenHeight, errorctx) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        width: screenWidth * 0.85,
        height: screenHeight * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormTitle(
              text: "Voto Confirmado",
              fontSize: 28,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Container(
                    height: screenHeight * 0.2,
                    child: Image(
                      image: AssetImage('assets/cancelIcon.png'),
                    )),
                Flexible(
                    child:
                        Text("Ha ocurrido un error en el registro de su voto"))
              ],
            ),
            Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {
                Navigator.of(errorctx).pop();
              },
              child: Text(
                "Regresar",
                style: TextStyle(
                    fontSize: 20, color: const Color.fromRGBO(58, 60, 172, 1)),
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
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (ctx) {
              return firstPoliticalPartyDialog(screenWidth, screenHeight, ctx);
            });
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 3,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          dense: true,
          title: Text(
            politicalParty.leader.toUpperCase(),
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
              backgroundImage: NetworkImage(politicalParty.logo),
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
