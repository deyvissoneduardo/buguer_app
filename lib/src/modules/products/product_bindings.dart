import 'package:get/get.dart';

import '../../services/products/products_service.dart';
import 'detail/product_detail_controller.dart';
import 'home/product_controller.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController(Get.find<ProductService>()));
    Get.lazyPut(() => ProductDetailController(Get.find<ProductService>()));
  }
}
