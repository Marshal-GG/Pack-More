import 'package:flutter/material.dart';
import 'package:packmore/core/constants.dart';
import 'package:packmore/core/notifiers.dart';
import 'package:packmore/screens/my_account/edit_my_account_details/edit_my_account_details.dart';
import 'package:packmore/screens/profile/components/profile_pic.dart';
import 'package:packmore/core/utils/user_preferences.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: kDefaultPaddin),
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
            SizedBox(height: kDefaultPaddin / 2),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text(user.name),
            ),
            ListTile(
              leading: Icon(Icons.mail_outline),
              title: Text(user.email),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text(user.about),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isDarkModeNotifier.value = !isDarkModeNotifier.value;
        },
        child: Icon(Icons.dark_mode_outlined),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("My Account"),
    );
  }
}
