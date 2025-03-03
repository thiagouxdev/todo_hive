import 'package:flutter/material.dart';
import 'package:todo_hive/core/navigation/root_navigation.dart';
import 'package:todo_hive/features/splash/views/splash_screen.dart';

import '../../features/welcome/presentation/views/welcome_page.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String welcome = '/welcome';
  static const String home = '/home';
  static const String notifications = '/notifications';

  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => const SplashScreen(),
        welcome: (context) => const WelcomePage(),
        home: (context) => const RootNavigation(),
      };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case home:
        return MaterialPageRoute(
          builder: (_) => const RootNavigation(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const WelcomePage(),
        );
    }
  }

  static void navigateToNotifications(BuildContext context) {
    Navigator.pushNamed(context, notifications);
  }
}
