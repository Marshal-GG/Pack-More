import 'package:flutter/material.dart';

import '../../../master_components/constants.dart';
import 'body.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.text,
    required this.press,
    required this.iconIndex,
  });

  final String text;
  final int iconIndex;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryLightColor,
              foregroundColor: kPrimaryColor,
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          onPressed: press, //dynamic calls onPressed
          child: Row(
            children: [
              Icon(pvticonsprofile[iconIndex]), //icon in dynamic way
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  text, //dynamic text
                  style: const TextStyle(
                    //color: kPrimaryLightColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded)
            ],
          )),
    );
  }
}
