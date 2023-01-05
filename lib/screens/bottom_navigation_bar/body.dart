import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:packmore/master_components/constants.dart';
import 'package:packmore/screens/main_home_screen/home_screen.dart';
import 'package:packmore/screens/profile/profile_screen.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarPage> {
  int _index = 0;
  final PageController _pageController = PageController();
  //Bottom Nav Bar Item List
  final items = <Widget>[
    const Icon(Icons.home_outlined, size: 30, color: kPrimaryColor),
    const Icon(Icons.shopping_cart_outlined, size: 30, color: kPrimaryColor),
    const Icon(Icons.add_shopping_cart_outlined,
        size: 30, color: kPrimaryColor),
    const Icon(Icons.person_outline, size: 30, color: kPrimaryColor),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      //backgroundColor: Colors.grey[400],
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _index = index;
          });
        },
        children: const [
          HomeScreen(),
          Center(child: Text('Cart')),
          Center(child: Text('Profile')),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
          index: _index,
          height: 55,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: kPrimaryLightColor,
          color: kPrimaryLightColor,
          items: items,
          onTap: (index) {
            _pageController.jumpToPage(index);
          }),
    );
  }
}
