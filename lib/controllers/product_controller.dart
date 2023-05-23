import 'package:e_commerce/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var productList = <Products>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProductList();
    super.onInit();
  }

  Future<List<Products>?> fetchProductts() async {
    var response = await http
        .get(Uri.parse("https://fakestoreapi.com/products?sort=desc"));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productsFromJson(jsonString);
    } else {
      return null;
    }
  }

  Future fetchProductList() async {
    try {
      isLoading(true);
      var products = await fetchProductts();
      if (products != null) {
        productList.assignAll(products);
      }
    } catch (e) {
      Get.snackbar("ee", "message");
    } finally {
      isLoading(false);
    }
  }
}
