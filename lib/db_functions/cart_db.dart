import 'package:e_commerce/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const CART_DB_NAME = 'cart-db';

abstract class CartDbFunctions {
  Future<void> addCart(CartModel obj);
  Future<List<CartModel>> getAllCartItems();
  Future<void> deleteCart(String id);
}

class CartDB implements CartDbFunctions {
  CartDB._internal();
  static CartDB instance = CartDB._internal();
  factory CartDB() {
    return instance;
  }

  ValueNotifier<List<CartModel>> cartListNotifier = ValueNotifier([]);

  @override
  Future<void> addCart(CartModel obj) async {
    final _db = await Hive.openBox<CartModel>(CART_DB_NAME);

    await _db.put(obj.id, obj);
  }

  Future<void> refresh() async {
    final _list = await getAllCartItems();
    cartListNotifier.value.clear();
    cartListNotifier.value.addAll(_list);
    cartListNotifier.notifyListeners();
    //print(cartListNotifier.value.indexWhere((element) => true));
  }

  @override
  Future<List<CartModel>> getAllCartItems() async {
    final _db = await Hive.openBox<CartModel>(CART_DB_NAME);
    return _db.values.toList();
  }

  @override
  Future<void> deleteCart(String id) async {
    final _db = await Hive.openBox<CartModel>(CART_DB_NAME);
    await _db.delete(id);
    refresh();
  }
}
