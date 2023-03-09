import 'package:flutter/material.dart';
import 'package:packmore/screens/cart/cart_screen.dart';
import 'package:packmore/screens/main_home_screen/home_screen.dart';
import 'package:packmore/screens/profile/profile_screen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int _currentpage = 0;
  List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(_currentpage),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        height: 55,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
        selectedIndex: _currentpage,
        onDestinationSelected: (value) {
          setState(() {
            _currentpage = value;
          });
        },
      ),
    );
  }
}
