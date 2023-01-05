import 'package:flutter/material.dart';
import 'package:packmore/master_components/constants.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/modi.png"),
          ),
          Positioned(
            right: -12,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  backgroundColor: kPrimaryLightColor,
                  foregroundColor: kPrimaryColor,
                ),
                onPressed: () {},
                child: const Icon(Icons.photo_camera),
              ),
            ),
          )
        ],
      ),
    );
  }
}
