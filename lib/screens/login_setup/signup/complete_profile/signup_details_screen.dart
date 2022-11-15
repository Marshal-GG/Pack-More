import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../components/background.dart';
import '../../components/social_sign_up.dart';
import '../../responsive.dart';
import 'components/complete_profile_top_image.dart';
import 'components/signup_details_form.dart';

class SignupDetailsScreen extends StatelessWidget {
  const SignupDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
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

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text("Sign Up"),
      backgroundColor: Colors.transparent,
      centerTitle: true,
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
          child: CompleteProfileTopImage(),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                width: 450,
                child: SignupDetailsForm(),
              ),
              SizedBox(
                height: kDefaultPaddin / 2,
              ),
              SocialSignUp(),
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
        const CompleteProfileTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: SignupDetailsForm(),
            ),
            Spacer(),
          ],
        ),
        const SocialSignUp()
      ],
    );
  }
}
