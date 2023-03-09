import 'package:flutter/material.dart';
import 'package:packmore/core/constants.dart';
import 'package:packmore/core/size_config.dart';
import 'package:packmore/models/user.dart';
import 'package:packmore/screens/profile/components/profile_pic.dart';
import 'package:packmore/core/utils/user_preferences.dart';

class EditMyAccountDetailsPage extends StatefulWidget {
  const EditMyAccountDetailsPage({super.key});

  @override
  State<EditMyAccountDetailsPage> createState() =>
      _EditMyAccountDetailsPageState();
}

class _EditMyAccountDetailsPageState extends State<EditMyAccountDetailsPage> {
  final List<String?> errors = [];
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
          Center(
            child: ProfilePic(
              isEdit: true,
              press: () async {},
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin / 2)),
          // buildNameEmail(user)
          TextFormField(
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNameNullError);
              }
              // ignore: avoid_returning_null_for_void
              return null;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kNameNullError);
                return kNameNullError;
              }
              return null;
            },
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              label: Text("Full Name"),
              counterText: user.name,
            ),
          )
        ],
      ),
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
