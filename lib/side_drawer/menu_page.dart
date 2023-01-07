import 'package:flutter/material.dart';
import 'package:packmore/screens/profile/profile_screen.dart';

class MenuItems {
  static const profile = MenuItem("Profile", Icons.person_outline);
  static const notifications =
      MenuItem("Notifications", Icons.notifications_outlined);
  static const help = MenuItem("Help", Icons.help_outlined);
  static const aboutus = MenuItem("About Us", Icons.info_outline_rounded);
  static const rateus = MenuItem("Rate Us", Icons.star_border_outlined);
  static const promos = MenuItem("Promotions", Icons.card_giftcard);

  static const all = <MenuItem>[
    profile,
    notifications,
    help,
    aboutus,
    rateus,
    promos,
  ];
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;

  const MenuItem(this.title, this.icon);
}
