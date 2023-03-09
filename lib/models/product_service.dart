import 'package:cloud_firestore/cloud_firestore.dart';
import 'product.dart';

class ProductServiceException implements Exception {
  final String message;

  ProductServiceException(this.message);

  @override
  String toString() => message;
}

class ProductService {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('Products');

  Future<List<Product>> getProducts() async {
    try {
      final QuerySnapshot querySnapshot = await collection.get();
      final List<Product> products = [];

      for (var product in querySnapshot.docs) {
        Map<String, dynamic> productData =
            product.data() as Map<String, dynamic>;
        products.add(Product.fromMap(productData));
      }
      return products;
    } catch (e) {
      throw ProductServiceException("Error fetching products: $e");
    }
  }

  Future<void> updateProduct(Map<dynamic, dynamic> product) async {
    try {
      final DocumentReference docRef = collection.doc(product['id']);
      await docRef.set(product);
    } catch (e) {
      throw ProductServiceException("Error updating product: $e");
    }
  }
}
