import 'package:flutter/material.dart';
import 'package:packmore/master_components/constants.dart';
import 'package:packmore/master_components/size_config.dart';
import 'package:packmore/models/user.dart';
import 'package:packmore/screens/my_account/edit_my_account_details/edit_my_account_details.dart';
import 'package:packmore/screens/profile/components/profile_pic.dart';
import 'package:packmore/utils/user_preferences.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(children: [
        SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
        Center(
            child: ProfilePic(
          isEdit: false,
          press: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const EditMyAccountDetailsPage(),
              ),
            );
          },
        )),
        SizedBox(height: getProportionateScreenHeight(kDefaultPaddin / 2)),
        buildNameEmail(user)
      ]),
    );
  }

  Column buildNameEmail(User user) {
    return Column(
      children: [
        Text(
          user.name,
          style: headingStyle,
        ),
        SizedBox(height: getProportionateScreenHeight(kDefaultPaddin / 2)),
        Text(
          user.email,
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      // leading: MenuWidget(),
      title: const Text(
        "My Account",
        style: TextStyle(color: kPrimaryColor),
      ),
      backgroundColor: kPrimaryLightColor,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: kPrimaryColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
