import 'package:e_commerce/controllers/category_controller.dart';
import 'package:e_commerce/views/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});
  List images = [
    NetworkImage(
        "https://img.freepik.com/premium-photo/gamer-workspace_127657-18683.jpg?w=360"),
    NetworkImage("https://wallpapercave.com/wp/wp5058491.jpg"),
    NetworkImage(
      "https://img.freepik.com/premium-photo/fashion-men-s-clothing-accessories-casual-style-flat-lay-copy-space_151851-434.jpg?w=2000",
    ),
    NetworkImage(
        "https://media.istockphoto.com/id/1208148708/photo/polka-dot-summer-brown-dress-suede-wedge-sandals-eco-straw-tote-bag-cosmetics-on-a-light.jpg?s=612x612&w=0&k=20&c=9Y135GYKHLlPotGIfynBbMPhXNbYeuDuFzreL_nfDE8=")
  ];

  @override
  Widget build(BuildContext context) {
    var categoryController = Get.put(CategoryController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(() {
        if (categoryController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: categoryController.categoryList.length,
            itemBuilder: (context, index) {
              return Center(
                child: GestureDetector(
                  onTap: () => Get.to(() => CategorysScreen()),
                  child: Container(
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        Container(
                          height: 200,
                          width: 340,
                          margin: EdgeInsets.only(bottom: 14),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: images[index], fit: BoxFit.cover)),
                        ),
                        Container(
                          height: 200,
                          width: 340,
                          margin: EdgeInsets.only(bottom: 14),
                          color: Colors.black38,
                        ),
                        Positioned(
                          top: 70,
                          bottom: 70,
                          left: 50,
                          right: 50,
                          child: Text(
                            categoryController.categoryList[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
