import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:votingsystem/core/provider/userProvider.dart';
import 'package:votingsystem/models/election.dart';

class ElectionsBloc {
  UserProvider userProvider = UserProvider();
  final _electionsController = BehaviorSubject<List<Election>>();
  Stream<List<Election>> get electionsStream => _electionsController.stream;
  Function(List<Election>) get changeElections => _electionsController.sink.add;
  Sink<List<Election>> get sinkElections => _electionsController.sink;

  getElections() async {
    UserProvider loginProvier = new UserProvider();

    final prefs = await SharedPreferences.getInstance();

    var resp = await loginProvier.getVoterById(prefs.getString('votanteId')!);
    final List<Election> elections =
        await userProvider.getPendingElections(resp!.city!, resp.id!);
    _electionsController.add(elections);
  }

  getPastElections() async {
    UserProvider loginProvier = new UserProvider();

    final prefs = await SharedPreferences.getInstance();

    var resp = await loginProvier.getVoterById(prefs.getString('votanteId')!);
    final List<Election> elections =
        await userProvider.getPastElections(resp!.city!, resp.id!);
    _electionsController.add(elections);
  }
}
