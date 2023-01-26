import 'package:flutter/material.dart';
import 'package:packmore/models/Cart.dart';
import '../../../master_components/constants.dart';
import '../../../master_components/size_config.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(60),
          // height: getProportionateScreenHeight(60),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(15),
              height: getProportionateScreenWidth(30),
              width: getProportionateScreenWidth(30),
              decoration: BoxDecoration(
                color: cart.product.color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(cart.product.image),
            ),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(20),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title,
              style: TextStyle(fontSize: 16, color: Colors.black),
              maxLines: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                  text: "\₹${cart.product.price}",
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                  children: [
                    TextSpan(
                      text: " x${cart.numOfItems}",
                      style: TextStyle(
                        color: kTextColor,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ],
    );
  }
}
