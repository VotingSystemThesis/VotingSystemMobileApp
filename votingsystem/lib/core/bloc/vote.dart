import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:votingsystem/core/provider/userProvider.dart';
import 'package:votingsystem/models/candidate.dart';
import 'package:votingsystem/models/election.dart';
import 'package:votingsystem/models/voteDto.dart';

class VoteBloc {
  Future<bool> vote(Candidate candidate, Election voting) async {
    UserProvider loginProvier = new UserProvider();

    final prefs = await SharedPreferences.getInstance();

    var voter = await loginProvier.getVoterById(prefs.getString('votanteId')!);

    VoteDto voteDto =
        VoteDto(candidate: [candidate], voter: voter, voting: voting);
    var response = await loginProvier.vote(voteDto);

    // var response = true;
    return response;
  }
}
