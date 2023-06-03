import 'package:e_commerce/controllers/product_controller.dart';
import 'package:e_commerce/db_functions/cart_db.dart';
import 'package:e_commerce/model/cart_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/views/cart_screen.dart';
import 'package:e_commerce/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final Products product;

  @override
  Widget build(BuildContext context) {
    var pdtController = Get.find<ProductController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Product Details",
          style: TextStyle(color: Colors.pink),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  width: 350,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(product.image),
                  )),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  product.title,
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              product.rating.rate.toString(),
                              style: const TextStyle(color: Colors.green),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(),
                Text(product.description)
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pink,
        label: Row(
          children: [Text("   Add to cart     "), Icon(Icons.shopping_cart)],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          addtocart();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> addtocart() async {
    final _model = CartModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: product.title,
        image: product.image,
        price: product.price);
    await CartDB.instance.addCart(_model);
    Get.snackbar("Cart Added", "Item Added to Cart",
        duration: Duration(seconds: 2));

    CartDB.instance.refresh();
  }
}
