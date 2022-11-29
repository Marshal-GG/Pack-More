import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../master_components/constants.dart';

class OtpScreenTopImage extends StatelessWidget {
  const OtpScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "OTP Verification",
            style: headingStyle,
          ),
          const Text(
            "We sent your code to +91 ********",
            textAlign: TextAlign.center,
            style: TextStyle(color: kTextColor),
          ),
          buildTimer(),
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

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "This code will expire in ",
          textAlign: TextAlign.center,
          style: TextStyle(color: kTextColor),
        ),
        TweenAnimationBuilder(
          tween: Tween(begin: 60.0, end: 0.00),
          duration: const Duration(seconds: 60),
          builder: (BuildContext context, value, child) => Text(
            "${value}s",
            style: const TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}
