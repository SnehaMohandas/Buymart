import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:e_commerce/views/cart_screen.dart';
import 'package:e_commerce/views/category_list_screen.dart';
import 'package:e_commerce/views/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Container(
          decoration: BoxDecoration(
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
                  "BuyMart",
                  style: TextStyle(color: Colors.pink),
                ),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TabBar(
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16.0,
                            ),
                            color: Colors.pink),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(
                            text: "Products",
                          ),
                          Tab(
                            text: "Categories",
                          ),
                          Tab(
                            text: "Cart",
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Container(
                    child: TabBarView(children: [
                      ProductScreen(),
                      CategoryScreen(),
                      CartScreen()
                    ]),
                  ))
                ],
              )),
        ));
  }
}
