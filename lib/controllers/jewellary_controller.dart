import 'dart:convert';

import 'package:e_commerce/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class JewellaryController extends GetxController {
  var jewellaryList = <Products>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchJewellaryList();
    super.onInit();
  }

  Future<List<Products>?> fetchjewellary() async {
    var response = await http
        .get(Uri.parse("https://fakestoreapi.com/products/category/jewelery"));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productsFromJson(jsonString);
    } else {
      return null;
    }
  }

  Future fetchJewellaryList() async {
    try {
      isLoading(true);
      var products = await fetchjewellary();
      if (products != null) {
        jewellaryList.assignAll(products);
      }
    } catch (e) {
      Get.snackbar("ee", "message");
    } finally {
      isLoading(false);
    }
  }
}
