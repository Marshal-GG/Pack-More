import 'package:flutter/material.dart';
import '../../../core/constants.dart';
import '../../../models/product.dart';
import 'product_title_with_image.dart';
import 'add_to_cart.dart';
import 'color_and_quantity.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';

const space = SizedBox(
  height: kDefaultPaddin / 2,
);

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin),
                  //height: 6000,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      ColorAndQuantity(product: product),
                      space,
                      Description(product: product),
                      space,
                      const CounterWithFavBtn(),
                      space,
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
