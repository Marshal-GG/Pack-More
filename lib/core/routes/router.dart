import 'package:flutter/material.dart';
import 'package:packmore/core/widget_tree.dart';
import 'package:packmore/core/widgets_wrapper.dart';
import 'package:packmore/screens/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import 'package:packmore/screens/login_setup/welcome/welcome_screen.dart';
import 'package:packmore/screens/main_home_screen/home_screen.dart';
import 'package:packmore/screens/my_account/my_account.dart';

import '../../screens/profile/profile_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
          builder: (_) => AuthWrapper(), settings: settings);
    case '/welcome':
      return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(), settings: settings);
    case '/widget-tree':
      return MaterialPageRoute(
          builder: (_) => WidgetTree(), settings: settings);
    case '/bottom_nav':
      return MaterialPageRoute(
          builder: (_) => BottomNavigationBarPage(), settings: settings);
    case '/home_screen':
      return MaterialPageRoute(
          builder: (_) => HomeScreen(), settings: settings);
    case '/my-account-page':
      return MaterialPageRoute(
          builder: (_) => MyAccountPage(), settings: settings);
    // case '/cart':
    // return MaterialPageRoute(builder: (_) => CartScreen());
    // case '/add_to_cart':
    // implement logic to add item to cart
    // break;
    case '/profile':
      return MaterialPageRoute(
          builder: (_) => ProfileScreen(), settings: settings);
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Page not found'),
                ),
              ),
          settings: settings);
  }
}
