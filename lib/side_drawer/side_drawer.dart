import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:packmore/master_components/constants.dart';
import 'package:packmore/screens/bottom_navigation_bar/body.dart';
import 'package:packmore/screens/main_home_screen/home_screen.dart';
import 'package:packmore/side_drawer/menu_page.dart';

//Not Working
//Fix later

class ZoomDrawerPage extends StatefulWidget {
  const ZoomDrawerPage({super.key});

  @override
  State<ZoomDrawerPage> createState() => _ZoomDrawerState();
}

class _ZoomDrawerState extends State<ZoomDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return const ZoomDrawer(
      style: DrawerStyle.style2,
      mainScreen: BottomNavigationBarPage(),
      menuScreen: MenuPage(),
    );
  }
}

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.menu_rounded,
        color: kPrimaryColor,
      ),
      onPressed: () {
        ZoomDrawer.of(context)!.toggle();
      },
    );
  }
}
