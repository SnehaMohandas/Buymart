import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  var categoryList = [].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    getCategoryList();
    super.onInit();
  }

  Future<List?> getCategories() async {
    var response = await http
        .get(Uri.parse("https://fakestoreapi.com/products/categories"));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      List<String> decodejson =
          (jsonDecode(jsonString) as List<dynamic>).cast<String>();

      return decodejson;
    } else {
      return null;
    }
  }

  void getCategoryList() async {
    try {
      isLoading(true);
      var categories = await getCategories();

      if (categories != null) {
        categoryList.assignAll(categories);
      }
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }
}
