import 'package:flutter/material.dart';
import 'package:votingsystem/router/routes.dart';
import 'package:votingsystem/utils/utils.dart';
import 'package:votingsystem/views/candidates/candidates_grid_view.dart';
//import 'package:votingsystem/views/common/icon_list.dart';
import 'package:votingsystem/views/common/main_background.dart';
import 'package:votingsystem/views/core/second_home.dart';
import 'package:votingsystem/views/profile/profile_page.dart';
import 'package:votingsystem/views/political parties/political_parties_list_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentroute = '';
  Route _onGenerateRoute(RouteSettings settings) {
    Widget page = const SecondHome();
    currentroute = settings.name!;

    switch (settings.name) {
      case routeSecondHome:
        page = const SecondHome();
        break;
      case routeProfile:
        page = const UserProfilePage();
        break;
      case routePoliticalParties:
        page = const PoliticalPartiesListView();
        break;
      case routeCandidates:
        page = const CandidatesGridView();
        break;
      default:
        debugPrint("NOMBRE SUBRUTA: " + settings.name!);
    }
    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }

  Widget homeBody(screenWidth, screenHeight) {
    return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: Navigator(
        key: Utils.homeNavigator,
        initialRoute: routeSecondHome,
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  Widget _iconsForNavbar() {
    //var testing = currentroute;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            Utils.homeNavigator.currentState!
                .pushReplacementNamed(routeSecondHome);
          },
          child: const Icon(
            Icons.home,
            size: 35,
          ),
        ),
        GestureDetector(
          onTap: () => Utils.homeNavigator.currentState!
              .pushReplacementNamed(routePoliticalParties),
          child: const Icon(
            Icons.article,
            size: 35,
          ),
        ),
        GestureDetector(
          onTap: () => Utils.homeNavigator.currentState!
              .pushReplacementNamed(routeCandidates),
          child: const Icon(
            Icons.how_to_vote,
            size: 35,
          ),
        ),
        GestureDetector(
          onTap: () {
            Utils.homeNavigator.currentState!
                .pushReplacementNamed(routeProfile);
          },
          child: const Icon(
            Icons.person,
            size: 35,
          ),
        )
      ],
    );
  }

  Widget homeNavbar(screenWidth, screenHeight) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 6,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: screenWidth * 0.7,
            height: 60,
            child: _iconsForNavbar(),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return MainBackground(
        distribution: 0.97,
        withPadding: false,
        child: Stack(
          children: [
            homeBody(screenWidth, screenHeight),
            homeNavbar(screenWidth, screenHeight),
          ],
        ));
  }
}
