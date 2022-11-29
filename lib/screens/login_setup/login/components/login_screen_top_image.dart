import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../master_components/constants.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Enter your Login Details",
            style: headingStyle,
          ),
          const SizedBox(
            height: kDefaultPaddin * 2,
          ),
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 8,
                child: SvgPicture.asset("assets/icons/login.svg"),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: kDefaultPaddin * 2,
          )
        ],
      ),
    );
  }
}
