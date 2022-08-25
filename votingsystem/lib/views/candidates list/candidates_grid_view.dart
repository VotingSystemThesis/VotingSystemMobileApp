import 'package:flutter/material.dart';
import 'package:votingsystem/models/candidate.dart';
import 'package:votingsystem/views/common/main_background.dart';

class CandidatesGridView extends StatefulWidget {
  const CandidatesGridView({Key? key}) : super(key: key);

  static List<Candidate> getCandidates() {
    const data = [
      {
        "id": 1,
        "name": "Rafael López Aliaga",
        "nationality": "Peruana",
        "age": 61,
        "politicalParty": "Renovación Popular",
        "education": "Universidad Completa",
        "imageUrl":
            "https://scontent-lim1-1.xx.fbcdn.net/v/t39.30808-6/252416439_304628981664062_6328251853672169312_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=xEPI3x8tP_0AX9VAntn&_nc_oc=AQmN1MCOMvmmAgKiJVlaqooerRC-JP6Cmpkt6B6r1AO-ZKoG1pI_Nqi6VKTRoJtPZogKOWZcL7ASBFgsxCviDC4P&tn=JNgdXXkjBnQqqUfM&_nc_ht=scontent-lim1-1.xx&oh=00_AT9vljO35hPQQpdNnLUOa-acMP_FbN9mOdQpR2xvkPitDQ&oe=630BFDD6",
      },
      {
        "id": 2,
        "name": "Omar Chehade",
        "nationality": "Peruana",
        "age": 51,
        "politicalParty": "Alianza para el Progreso",
        "education": "Universidad Completa",
        "imageUrl":
            "https://pbs.twimg.com/profile_images/1212053179174506496/HrRIFRtz_400x400.jpg",
      },
      {
        "id": 3,
        "name": "George Forsyth",
        "nationality": "Peruana",
        "age": 40,
        "politicalParty": "Somos Perú",
        "education": "Universidad Completa",
        "imageUrl":
            "https://pbs.twimg.com/profile_images/1368295368782385153/iI_e0VzN_400x400.jpg",
      },
      {
        "id": 4,
        "name": "Elizabeth León Chinchay",
        "nationality": "Peruana",
        "age": 56,
        "politicalParty": "Frente de la Esperanza",
        "education": "Universidad Completa",
        "imageUrl":
            "http://peruvotoinformado.com/img/candidatos2021/137289.jpg",
      },
      {
        "id": 5,
        "name": "Gonzalo Alegría",
        "nationality": "Peruana",
        "age": 59,
        "politicalParty": "Juntos por el Perú",
        "education": "Universidad Completa",
        "imageUrl":
            "https://scontent-lim1-1.xx.fbcdn.net/v/t39.30808-6/299703434_129977779761288_5401879412645266344_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=6vf2smYo3ycAX-whXXm&_nc_ht=scontent-lim1-1.xx&oh=00_AT9xGNNtBZquwAP2Ft9LWTLDK16W8Npt9soRXpZ2c-zBcQ&oe=630C00F2",
      },
      {
        "id": 6,
        "name": "Yuri Castro",
        "nationality": "Peruana",
        "age": 43,
        "politicalParty": "Perú Libre",
        "education": "Universidad Completa",
        "imageUrl":
            "https://pbs.twimg.com/profile_images/1488207703495393281/LcoqMECj_400x400.jpg",
      },
    ];

    return data.map<Candidate>(Candidate.fromJson).toList();
  }

  @override
  State<CandidatesGridView> createState() => _CandidatesGridViewState();
}

class _CandidatesGridViewState extends State<CandidatesGridView> {
  List<Candidate> candidates = CandidatesGridView.getCandidates();
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
            child: buildCandidates(candidates),
          ),
        ],
      ),
    );
  }

  Widget buildCandidates(List<Candidate> candidates) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: candidates.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(candidates[index].imageUrl),
                    ),
                  ),
                  const Icon(
                    Icons.more_vert,
                    size: 30,
                    color: Colors.black,
                  ),
                ],
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
        );
      },
    );
  }
}
