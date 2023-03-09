// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
// import 'package:packmore/core/constants.dart';
// import 'package:packmore/screens/cart/cart_screen.dart';
// import 'package:packmore/screens/main_home_screen/home_screen.dart';
// import 'package:packmore/screens/profile/profile_screen.dart';

// class BottomNavigationBarPage extends StatefulWidget {
//   const BottomNavigationBarPage({super.key});

//   @override
//   State<BottomNavigationBarPage> createState() => _BottomNavigationBarState();
// }

// class _BottomNavigationBarState extends State<BottomNavigationBarPage> {
//   int _currentIndex = 0;
//   final List<Widget> _screens = [
//     HomeScreen(),
//     // CartScreen(),
//     ProfileScreen(),
//     ProfileScreen(),
//     ProfileScreen(),
//   ];

//   // void _onTabTapped(int index) {
//   //   setState(() {
//   //     _currentIndex = index;
//   //   });
//   // }

//   final PageController _pageController = PageController();

//   final items = <Widget>[
//     const Icon(Icons.home_outlined, size: 30, color: kPrimaryColor),
//     const Icon(Icons.shopping_cart_outlined, size: 30, color: kPrimaryColor),
//     const Icon(Icons.add_shopping_cart_outlined,
//         size: 30, color: kPrimaryColor),
//     const Icon(Icons.person_outline, size: 30, color: kPrimaryColor),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _currentIndex,
//         children: _screens,
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         index: _currentIndex,
//         height: 55,
//         animationCurve: Curves.easeInOut,
//         backgroundColor: Colors.transparent,
//         buttonBackgroundColor: kPrimaryLightColor,
//         color: kPrimaryLightColor,
//         items: items,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });

//           switch (index) {
//             case 0:
//               Navigator.pushNamed(context, '/home_screen');
//               break;
//             case 1:
//               Navigator.pushNamed(context, '/profile');
//               break;
//             case 2:
//               Navigator.pushNamed(context, '/profile');
//               break;
//             case 3:
//               Navigator.pushNamed(context, '/profile');
//               break;
//           }
//           _pageController.jumpToPage(index);
//         },
//       ),
//     );
//     // SafeArea(
//     //   top: false,
//     //   child: Scaffold(
//     //     extendBody: true,
//     //     //backgroundColor: Colors.grey[400],
//     //     // appBar: AppBar(),
//     //     body: PageView(
//     //       controller: _pageController,
//     //       onPageChanged: (index) {
//     //         setState(() {
//     //           _index = index;
//     //         });
//     //       },
//     //       children: const [
//     //         HomeScreen(),
//     //         // CartScreen(),
//     //         Center(child: Text('Cart')),
//     //         ProfileScreen(),
//     //       ],
//     //     ),
//     //     bottomNavigationBar: CurvedNavigationBar(
//     //       index: _index,
//     //       height: 55,
//     //       animationCurve: Curves.easeInOut,
//     //       backgroundColor: Colors.transparent,
//     //       buttonBackgroundColor: kPrimaryLightColor,
//     //       color: kPrimaryLightColor,
//     //       items: items,
//     //       onTap: (index) {
//     //         setState(() {
//     //           _index = index;
//     //         });
//     //         switch (index) {
//     //           case 0:
//     //             Navigator.pushNamed(context, '/home_screen');
//     //             break;
//     //           case 1:
//     //             Navigator.pushNamed(context, '/cart');
//     //             break;
//     //           case 2:
//     //             Navigator.pushNamed(context, '/add_to_cart');
//     //             break;
//     //           case 3:
//     //             Navigator.pushNamed(context, '/profile');
//     //             break;
//     //           default:
//     //             break;
//     //         }
//     //       },
//     //     ),
//     //   ),
//     // );
//   }
// }
