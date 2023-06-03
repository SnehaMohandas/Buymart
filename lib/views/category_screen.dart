import 'dart:math';

import 'package:e_commerce/controllers/jewellary_controller.dart';
import 'package:e_commerce/controllers/product_controller.dart';
import 'package:e_commerce/views/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, this.categoryList});
  final categoryList;

  @override
  Widget build(BuildContext context) {
    var pdtController = Get.find<ProductController>();

    var pdts = pdtController.productList[0];

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 247, 240, 238),
        Color.fromARGB(255, 250, 213, 227)
      ], begin: Alignment.bottomLeft, end: Alignment.topLeft)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            categoryList,
            style: TextStyle(color: Colors.pink),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10),
              itemCount: pdtController.productList
                  .where((p0) => p0.category == categoryList)
                  .length,
              itemBuilder: (context, index) {
                // // if (categoryList == pdtController.productList[index].category) {
                // print(pdtController.productList
                //     .where((p0) => p0.category == categoryList)
                //     .map((e) => e.image));

                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () => Get.to(() => DetailsScreen(
                        product: pdtController.productList
                            .where((p0) => p0.category == categoryList)
                            .map((e) => e)
                            .toList()[index])),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      semanticContainer: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 15,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              height: 130,
                              width: double.infinity,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(pdtController
                                        .productList
                                        .where(
                                            (p0) => p0.category == categoryList)
                                        .map((e) => e.image)
                                        .toList()[index]),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              pdtController.productList
                                  .where((p0) => p0.category == categoryList)
                                  .map((e) => e.title)
                                  .toList()[index],
                              maxLines: 2,
                              style: const TextStyle(color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${pdtController.productList.where((p0) => p0.category == categoryList).map((e) => e.price).toList()[index]}',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  if (pdtController.productList[index].rating !=
                                      null)
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 2),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              pdtController.productList
                                                  .where((p0) =>
                                                      p0.category ==
                                                      categoryList)
                                                  .map((e) =>
                                                      e.rating.rate.toString())
                                                  .toList()[index],
                                              style: const TextStyle(
                                                  color: Colors.green),
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
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
