import 'package:flutter/material.dart';
import 'package:votingsystem/core/bloc/vote.dart';
import 'package:votingsystem/models/political_party.dart';
import 'package:votingsystem/views/common/form_button.dart';
import 'package:votingsystem/views/common/form_title.dart';

class SinglePoliticalParty extends StatelessWidget {
  final PoliticalParty politicalParty;
  const SinglePoliticalParty(this.politicalParty, {Key? key}) : super(key: key);

  Widget firstPoliticalPartyDialog(screenWidth, screenHeight, ctx) {
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
                      politicalParty.leader,
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
                      politicalParty.name,
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
                    var response = await VoteBloc().vote();
                    if (response) {
                      showDialog(
                          context: ctx,
                          builder: (successctx) {
                            return successDialog(
                                screenWidth, screenHeight, successctx, ctx);
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

  Widget successDialog(screenWidth, screenHeight, successctx, ctx) {
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
              height: 50,
            ),
            SizedBox(
                height: screenHeight * 0.2,
                child: const Image(
                  image: AssetImage('assets/correctIcon.png'),
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
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (ctx) {
              return firstPoliticalPartyDialog(screenWidth, screenHeight, ctx);
            });
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
