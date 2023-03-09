import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants.dart';

class ForgotPasswordTopImage extends StatelessWidget {
  const ForgotPasswordTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Password Reset",
            style: headingStyle,
          ),
          const Text(
            "Enter your Email ID to reset your password",
            textAlign: TextAlign.center,
            style: TextStyle(color: kTextColor),
          ),
          const SizedBox(height: kDefaultPaddin),
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 8,
                child: SvgPicture.asset("assets/icons/signup.svg"),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: kDefaultPaddin),
        ],
      ),
    );
  }
}
