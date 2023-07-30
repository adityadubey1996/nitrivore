import 'package:flutter/material.dart';
import 'package:nutrivine/screen/index_screen.dart';
import 'package:nutrivine/screen/order_screen/order_view.dart';
import 'package:nutrivine/screen/splash_screen.dart';

/// Route Generator
/// Handles the new routes
class AppRouteGenerator {
  static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case 'home_screen':
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return IndexScreen();
            });

      case 'splash_screen':
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => SplashScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );

      case 'order_screen':
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return OrderScreen();
            });

      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return IndexScreen();
            });
    }
  }
}
