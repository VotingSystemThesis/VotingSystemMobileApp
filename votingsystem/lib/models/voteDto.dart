import 'package:votingsystem/models/candidate.dart';
import 'package:votingsystem/models/election.dart';
import 'package:votingsystem/models/political_party.dart';
import 'package:votingsystem/models/voter.dart';

class VoteDto {
  List<Candidate>? candidate;
  Election? voting;
  Voter? voter;

  VoteDto({
    required this.candidate,
    required this.voter,
    required this.voting,
  });
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> candidatesToSend = [];
    candidate!.forEach((element) {
      candidatesToSend.add(element.toJson());
    });

    return {
      'voting': voting?.toJson(),
      'voter': voter?.toJson(),
      'candidateList': candidatesToSend
    };
  }
}
