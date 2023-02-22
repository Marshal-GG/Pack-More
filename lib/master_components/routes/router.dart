import 'package:flutter/material.dart';
import 'package:packmore/master_components/widgets_wrapper.dart';
import 'package:packmore/screens/login_setup/welcome/welcome_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => AuthWrapper());
    case '/welcome':
      return MaterialPageRoute(builder: (_) => const WelcomeScreen());
    case '/bottom_nav':
      return MaterialPageRoute(
          builder: (_) => BottomNavigationBar(
                items: [],
              ));
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ),
      );
  }
}
