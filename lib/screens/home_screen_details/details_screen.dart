import 'package:flutter/material.dart';
import '../../core/constants.dart';
import '../../../models/product.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(
                  int.parse(product.color.substring(1, 3), radix: 16),
                  int.parse(product.color.substring(3, 5), radix: 16),
                  int.parse(product.color.substring(5, 7), radix: 16),
                  1,
                ),
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(
                  int.parse(product.color.substring(1, 3), radix: 16),
                  int.parse(product.color.substring(3, 5), radix: 16),
                  int.parse(product.color.substring(5, 7), radix: 16),
                  1,
                ),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          color: Colors.white,
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          color: Colors.white,
          onPressed: () {},
        ),
        const SizedBox(
          width: kDefaultPaddin / 2,
        )
      ],
    );
  }
}
