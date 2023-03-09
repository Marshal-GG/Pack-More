import 'package:flutter/material.dart';
import 'package:packmore/side_drawer/side_drawer.dart';
import '../../core/constants.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryLightColor,
      elevation: 0,
      leading: const MenuWidget(),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          color: kPrimaryColor,
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          color: kPrimaryColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ),
            );
          },
        ),
        const SizedBox(
          width: kDefaultPaddin / 2,
        )
      ],
    );
  }
}
