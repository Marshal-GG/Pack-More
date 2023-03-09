import 'package:flutter/material.dart';
import '../../../core/constants.dart';
import '../../../models/product.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Color.fromRGBO(
                  int.parse(product.color.substring(1, 3), radix: 16),
                  int.parse(product.color.substring(3, 5), radix: 16),
                  int.parse(product.color.substring(5, 7), radix: 16),
                  1,
                ),
              ),
            ),
            child: IconButton(
              icon: Icon(
                Icons.add_shopping_cart_outlined,
                color: Color.fromRGBO(
                  int.parse(product.color.substring(1, 3), radix: 16),
                  int.parse(product.color.substring(3, 5), radix: 16),
                  int.parse(product.color.substring(5, 7), radix: 16),
                  1,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    backgroundColor: Color.fromRGBO(
                      int.parse(product.color.substring(1, 3), radix: 16),
                      int.parse(product.color.substring(3, 5), radix: 16),
                      int.parse(product.color.substring(5, 7), radix: 16),
                      1,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Buy Now".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
