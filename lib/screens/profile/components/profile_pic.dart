import 'package:flutter/material.dart';
import 'package:packmore/master_components/constants.dart';
import 'package:packmore/utils/user_preferences.dart';

class ProfilePic extends StatelessWidget {
  final VoidCallback press;
  final bool isEdit;
  const ProfilePic({
    super.key,
    required this.press,
    required this.isEdit,
  });

  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
                user.imagePath), //from the stored image from directory
          ),
          buildEditButton()
        ],
      ),
    );
  }

  Positioned buildEditButton() {
    return Positioned(
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
          onPressed: press,
          child: isEdit
              ? const Icon(Icons.add_a_photo_outlined)
              : const Icon(Icons.edit),
        ),
      ),
    );
  }
}
