import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:packmore/screens/login_setup/welcome/welcome_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

List<IconData> pvticonsprofile = [
// The underscore declares a variable as private in dart.
  Icons.person_outline,
  Icons.notifications_outlined,
  Icons.settings_outlined,
  Icons.help_center_outlined,
  Icons.logout_outlined,
];

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _signOut() async {
    await _auth.signOut();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const WelcomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfilePic(),
        const SizedBox(height: 20),
        ProfileMenu(
          iconIndex: 0,
          text: "My Account",
          press: () {},
        ),
        ProfileMenu(
          iconIndex: 1,
          text: "Notifications",
          press: () {},
        ),
        ProfileMenu(
          iconIndex: 2,
          text: "Settings",
          press: () {},
        ),
        ProfileMenu(
          iconIndex: 3,
          text: "Help Center",
          press: () {},
        ),
        ProfileMenu(
          iconIndex: 4,
          text: "Log Out",
          press: _signOut,
        ),
      ],
    );
  }
}
