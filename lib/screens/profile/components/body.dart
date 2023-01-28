import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:packmore/master_components/constants.dart';
import 'package:packmore/master_components/size_config.dart';
import 'package:packmore/screens/login_setup/welcome/welcome_screen.dart';
import 'package:packmore/screens/my_account/edit_my_account_details/edit_my_account_details.dart';
import 'package:packmore/screens/my_account/my_account.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

List<IconData> pvticonsprofile = [
  Icons.person_outline,
  Icons.notifications_outlined,
  Icons.settings_outlined,
  Icons.help_center_outlined,
  Icons.info_outline,
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
            ProfilePic(
                isEdit: false,
                press: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const EditMyAccountDetailsPage(),
                    ),
                  );
                }),
            SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
            ProfileMenu(
              iconIndex: 0,
              text: "My Account",
              press: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const MyAccountPage(),
                  ),
                );
              },
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
              text: "About Us",
              press: () {
                showDialog(
                    context: context,
                    builder: (context) => const AboutDialog(
                          applicationIcon: FlutterLogo(),
                          applicationLegalese: "Legalese",
                          applicationName: "Pack More",
                          applicationVersion: "Beta v1.0.0",
                          children: [
                            Text(
                                "This the the licences data for the application.")
                          ],
                        ));
              },
            ),
            ProfileMenu(
              iconIndex: 5,
              text: "Log Out",
              press: _signOut,
            ),
          ],
        ),
      ),
    );
  }
}
