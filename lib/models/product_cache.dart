// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:convert';
// import 'dart:io';

// class ProductCache {
//   final Map<String, Map<dynamic, dynamic>> _cachedProducts = {};
//   final Map<String, DocumentReference> _cachedProductReferences = {};

//   void cacheProducts(List<Map<dynamic, dynamic>> products,
//       CollectionReference collection) async {
//     for (var product in products) {
//       cacheProduct(product, collection.doc(product["id"]));
//     }
//   }

//   void cacheProduct(
//       Map<dynamic, dynamic> product, DocumentReference docRef) async {
//     _cachedProducts[product["id"]] = product;
//     _cachedProductReferences[product["id"]] = docRef;
//     await saveCacheToFile();
//   }

//   List<Map<dynamic, dynamic>> getCachedProducts() {
//     return _cachedProducts.values.toList();
//   }

//   DocumentReference? getCachedProductReference(String productId) {
//     return _cachedProductReferences[productId];
//   }

//   Future<void> saveCacheToFile() async {
//     final String fileContent = jsonEncode({
//       'products': _cachedProducts,
//       'productReferences': _cachedProductReferences,
//     });
//     final File file = File('product_cache.json');
//     await file.writeAsString(fileContent);
//   }

//   Future<void> loadCacheFromFile() async {
//     final File file = File('product_cache.json');
//     if (!await file.exists()) {
//       return;
//     }
//     final String fileContent = await file.readAsString();
//     final Map<String, dynamic> cacheData = jsonDecode(fileContent);
//     _cachedProducts.clear();
//     _cachedProductReferences.clear();
//     _cachedProducts
//         .addAll(cacheData['products'] as Map<String, Map<dynamic, dynamic>>);
//     _cachedProductReferences.addAll(
//         cacheData['productReferences'] as Map<String, DocumentReference>);
//   }
// }
