import 'package:get/get.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../repositories/products/products_repository.dart';
import '../../repositories/products/products_repository_impl.dart';
import '../../services/products/products_service.dart';
import '../../services/products/products_service_impl.dart';
import 'home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductRepositoryImpl(Get.find<CustomDio>()));
    Get.lazyPut<ProductService>(
      () => ProductsServiceImpl(Get.find<ProductRepository>()),
    );
    Get.lazyPut(() => HomeController(Get.find<ProductService>()));
  }
}
