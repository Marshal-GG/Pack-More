import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String image;
  final String title;
  final double price;
  final String description;
  final String size;
  final String color;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });

  // factory Product.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
  //   Map<String, dynamic>? data = doc.data();
  //   return Product(
  //       id: doc.id,
  //       image: data?['image'],
  //       title: data?['title'],
  //       price: data != null ? (data['price'] as double?) ?? 0.0 : 0.0,
  //       description: data?['description'],
  //       size: data?['size'],
  //       color: data?['color']);
  // }

  Product.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        image = map['image'],
        title = map['title'],
        price = map['price'] is double ? map['price'] : 0.0,
        description = map['description'],
        size = map['size'],
        color = map['color'];
}
