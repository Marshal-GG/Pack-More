import 'package:flutter/material.dart';
import '../../../../core/constants.dart';
import '../../components/background.dart';
import '../../components/social_sign_up.dart';
import '../../responsive.dart';
import 'components/sign_up_form.dart';
import 'components/sign_up_top_image.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar2(),
      body: const Background(
        child: SingleChildScrollView(
          child: Responsive(
            mobile: MobileSignUpScreen(),
            desktop: DesktopSignUpScreen(),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar2() {
    return AppBar(
      elevation: 0,
      title: const Text("Sign Up"),
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }
}

class DesktopSignUpScreen extends StatelessWidget {
  const DesktopSignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: SignUpScreenTopImage(),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                width: 450,
                child: SignUpForm(),
              ),
              SizedBox(
                height: kDefaultPaddin / 2,
              ),
              SocialSignUp(),
              SizedBox(height: kDefaultPaddin),
            ],
          ),
        ),
      ],
    );
  }
}

class MobileSignUpScreen extends StatelessWidget {
  const MobileSignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SignUpScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: SignUpForm(),
            ),
            Spacer(),
          ],
        ),
        const SocialSignUp(),
        const SizedBox(height: kDefaultPaddin),
      ],
    );
  }
}
