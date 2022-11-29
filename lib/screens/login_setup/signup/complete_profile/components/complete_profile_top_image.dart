import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../master_components/constants.dart';

class CompleteProfileTopImage extends StatelessWidget {
  const CompleteProfileTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Complete Profile",
            style: headingStyle,
          ),
          const Text(
            "Complete your details or continue \nwith social media",
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
