import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:votingsystem/models/candidate.dart';
import 'package:votingsystem/router/routes.dart';
import 'package:votingsystem/utils/utils.dart';
import 'package:votingsystem/views/auth/login_page.dart';
import 'package:votingsystem/views/auth/login_page_scan.dart';
import 'package:votingsystem/views/candidates/candidate_details.dart';
import 'package:votingsystem/views/core/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voting System',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
      navigatorKey: Utils.mainNavigator,
      onGenerateRoute: (settings) {
        Widget page;
        if (settings.name == routeLoginView) {
          page = const LoginPage();
        } else if (settings.name!.startsWith(routeLoginViewScan)) {
          page = const LoginPageScan();
        } else if (settings.name!.startsWith(routeHome)) {
          page = const Home();
        } else if (settings.name!.startsWith(routeCandidateDetails)) {
          final args = settings.arguments as Candidate;
          page = CandidateDetails(args);
        } else {
          throw Exception('Unknown route: ${settings.name}');
        }
        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          },
          settings: settings,
        );
      },
      home: const LoginPage(),
    );
  }
}
