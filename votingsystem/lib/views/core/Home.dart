import 'package:flutter/material.dart';
import 'package:votingsystem/router/routes.dart';
import 'package:votingsystem/utils/Utils.dart';
import 'package:votingsystem/views/common/IconList.dart';
import 'package:votingsystem/views/common/MainBackground.dart';
import 'package:votingsystem/views/core/SecondHome.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentroute = '';
  Route _onGenerateRoute(RouteSettings settings) {
    Widget page = SecondHome();
    currentroute = settings.name!;

    switch (settings.name) {
      case routeSecondHome:
        page = SecondHome();
        break;

      default:
        print("NOMBRE SUBRUTA: " + settings.name!);
    }
    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }

  Widget homeBody(screenWidth, screenHeight) {
    return Container(
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
    var testing = currentroute;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.home,
          size: 35,
        ),
        Icon(
          Icons.article,
          size: 35,
        ),
        Icon(
          Icons.person,
          size: 35,
        )
      ],
    );
  }

  Widget homeNavbar(screenWidth, screenHeight) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 6,
          child: Container(
            padding: EdgeInsets.all(10),
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
