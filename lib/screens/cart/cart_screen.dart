import 'package:flutter/material.dart';
import 'package:packmore/master_components/constants.dart';
import 'package:packmore/models/Cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      // leading: MenuWidget(),
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(color: kPrimaryColor),
          ),
          Text(
            "${demoCarts.length} Items",
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
      backgroundColor: kPrimaryLightColor,
      centerTitle: true,
    );
  }
}
