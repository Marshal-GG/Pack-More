import 'package:flutter/material.dart';
import '../../../../core/constants.dart';
import '../../login/login_screen.dart';
import '../../signup/email_pass/signup_screen.dart';

class LoginSignupBtn extends StatelessWidget {
  const LoginSignupBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const LoginScreen();
                },
              ),
            );
          },
          child: Text("Login".toUpperCase()),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SignupScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryLightColor, elevation: 0),
          child: Text(
            "Signup".toUpperCase(),
            style: const TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
