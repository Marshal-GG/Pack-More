import 'package:flutter/material.dart';
import '../../../core/constants.dart';
import '../../../../models/product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback press;
  const ItemCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin),
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                  int.parse(product.color.substring(1, 3), radix: 16),
                  int.parse(product.color.substring(3, 5), radix: 16),
                  int.parse(product.color.substring(5, 7), radix: 16),
                  1,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child:
                  Hero(tag: "${product.id}", child: Image.asset(product.image)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              product.title,
              style: const TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "₹${product.price}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}