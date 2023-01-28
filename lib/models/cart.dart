import 'package:packmore/models/product.dart';

class Cart {
  final Product product;
  final int numOfItems;

  Cart({required this.product, required this.numOfItems});
}

List<Cart> demoCarts = [
  Cart(product: products[2], numOfItems: 3),
  Cart(product: products[0], numOfItems: 2),
  Cart(product: products[1], numOfItems: 1),
  Cart(product: products[3], numOfItems: 1),
];
