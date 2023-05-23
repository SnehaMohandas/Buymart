import 'package:e_commerce/db_functions/cart_db.dart';
import 'package:e_commerce/model/cart_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/views/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartDB.instance.refresh();
    return ValueListenableBuilder(
        valueListenable: CartDB().cartListNotifier,
        builder: (BuildContext ctx, List<CartModel> newList, Widget? _) {
          return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (ctx, index) {
                final _value = newList[index];
                return Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(_value.image),
                      )),
                    ),
                    title: Text(
                      _value.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    subtitle: Text(
                      "\$${_value.price}",
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          CartDB.instance.deleteCart(_value.id);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.blue,
                        )),
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: newList.length);
        });
  }
}
