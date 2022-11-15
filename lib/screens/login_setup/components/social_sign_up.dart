import 'package:flutter/material.dart';
import '../../../home/home_screen.dart';
import '../signup/otp/otp_screen.dart';
import 'google_auth/firebase_services.dart';
import 'or_divider.dart';
import 'social_icon.dart';

class SocialSignUp extends StatelessWidget {
  const SocialSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialIcon(
              iconsrc: "assets/icons/facebook.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const OtpScreen();
                    },
                  ),
                );
              },
            ),
            SocialIcon(
              iconsrc: "assets/icons/google.svg",
              press: () async {
                await FirebaseServices().signInWithGoogle();
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ),
                );
              },
            ),
            // SocialIcon(
            //   iconsrc: "assets/icons/phone.svg",
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return const PhoneNumberScreen();
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        )
      ],
    );
  }
}
