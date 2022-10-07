import 'package:votingsystem/models/candidate.dart';
import 'package:votingsystem/models/election.dart';
import 'package:votingsystem/models/political_party.dart';
import 'package:votingsystem/models/voter.dart';

class VoteDto {
  Candidate? candidate;
  Election? voting;
  Voter? voter;

  VoteDto({
    required this.candidate,
    required this.voter,
    required this.voting,
  });
}
