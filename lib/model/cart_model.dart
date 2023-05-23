import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 2)
class CartModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final double price;

  CartModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.price});
}
