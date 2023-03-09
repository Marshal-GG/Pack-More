import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Pack More",
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
                child: SvgPicture.asset("assets/icons/chat.svg"),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: kDefaultPaddin * 2,
          ),
        ],
      ),
    );
  }
}
