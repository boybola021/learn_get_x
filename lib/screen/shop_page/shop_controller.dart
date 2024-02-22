import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learn_get_x/screen/shop_page/htpp_service.dart';

import 'model.dart';

class ShopController extends GetxController {
  var isLoading = true.obs;
  List<Products> listProducts = <Products>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await repository.fetchData();
      if (products.isNotEmpty) {
        debugPrint("ShopController => $products");
        listProducts.assignAll(products);
        update();
      }
    } catch (e) {
      debugPrint("Error ShopController => $e");
    } finally {
      isLoading(false);
    }
  }
}
