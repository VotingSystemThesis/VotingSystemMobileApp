import 'package:flutter/material.dart';

class Utils {
  static GlobalKey<NavigatorState> mainNavigator = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> homeNavigator = GlobalKey<NavigatorState>();

  static ImageProvider getPosterImage(String posterPath) {
    if (posterPath.contains(RegExp(r'http', caseSensitive: false))) {
      return NetworkImage(posterPath);
    } else {
      return const AssetImage("assets/img/no-image.jpg");
    }
  }

  Widget loader(screenWidth, screenHeight) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      color: Colors.white.withOpacity(0.9),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
