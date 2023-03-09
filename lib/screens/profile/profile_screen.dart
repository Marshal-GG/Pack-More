import 'package:flutter/material.dart';
import 'package:packmore/core/constants.dart';
import 'package:packmore/side_drawer/side_drawer.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      // leading: MenuWidget(),
      title: const Text(
        "Profile",
        style: TextStyle(color: kPrimaryColor),
      ),
      backgroundColor: kPrimaryLightColor,
      centerTitle: true,
    );
  }
}
