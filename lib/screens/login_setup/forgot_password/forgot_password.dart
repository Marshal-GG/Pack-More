import 'package:flutter/material.dart';
// import 'package:project_jh/constants.dart';
// import 'package:project_jh/main.dart';
// import 'package:project_jh/screens/home/home_screen.dart';
// import 'package:project_jh/screens/login_setup/signup/email_pass/components/sign_up_form.dart';

import '../components/background.dart';
import '../responsive.dart';
import 'components/forgot_password_form.dart';
import 'components/forgot_password_top_image.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Background(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Responsive(
              mobile: MobileForgotPasswordScreen(),
              desktop: DesktopForgotPasswordScreen(),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text("Forgot Password"),
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }
}

class MobileForgotPasswordScreen extends StatelessWidget {
  const MobileForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ForgotPasswordTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: ForgotPasswordForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class DesktopForgotPasswordScreen extends StatelessWidget {
  const DesktopForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: ForgotPasswordTopImage()),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 450,
              child: ForgotPasswordForm(),
            ),
          ],
        ))
      ],
    );
  }
}
