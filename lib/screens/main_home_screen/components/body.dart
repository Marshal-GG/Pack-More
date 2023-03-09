import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../core/constants.dart';
import '../../../models/product.dart';
import '../../../models/product_service.dart';
import '../../home_screen_details/details_screen.dart';
import 'categories.dart';
import 'item_card.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Stream<QuerySnapshot> _productStream;

  @override
  void initState() {
    super.initState();
    _productStream =
        FirebaseFirestore.instance.collection('Products').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _productStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error fetching products'));
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            // final List<Product> products = snapshot.data!.docs
            //     .map((doc) => Product.fromFirestore(
            //         doc as DocumentSnapshot<Map<String, dynamic>>))
            //     .toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: Text("Home", style: headingStyle),
                ),
                Categories(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                    // child: GridView.builder(
                    //   // itemCount: products.length,
                    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 2,
                    //     mainAxisSpacing: kDefaultPaddin,
                    //     crossAxisSpacing: kDefaultPaddin,
                    //     childAspectRatio: 0.75,
                    //   ),
                    //   itemBuilder: (context, index) => ItemCard(
                    //     product: products[index],
                    //     press: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) =>
                    //               DetailsScreen(product: products[index]),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
