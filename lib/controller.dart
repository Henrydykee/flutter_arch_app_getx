import 'package:flutter_arch_app_getx/model.dart';
import 'package:flutter_arch_app_getx/remote_service.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
  var productList = List<Product>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    var products = await RemoteServices.fetchProducts();
    if (products != null) {
      productList.value = products;
    }
  }
}
