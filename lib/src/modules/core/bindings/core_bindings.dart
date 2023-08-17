import 'package:get/get.dart';

import '../../../core/rest_client/custom_dio.dart';
import '../../../core/storage/session_storage.dart';
import '../../../core/storage/storege.dart';
import '../../../repositories/payment_type/payment_type_repository.dart';
import '../../../repositories/payment_type/payment_type_repository_impl.dart';
import '../../../repositories/products/products_repository.dart';
import '../../../repositories/products/products_repository_impl.dart';
import '../../../repositories/user/user_repository.dart';
import '../../../repositories/user/user_repository_impl.dart';
import '../../../services/auth/auth_service.dart';
import '../../../services/products/products_service.dart';
import '../../auth/login/login_bindings.dart';
import '../../auth/login/login_controller.dart';
import '../../auth/register/register_bindings.dart';
import '../../auth/register/register_controller.dart';
import '../../products/detail/product_detail_controller.dart';
import '../../products/home/product_controller.dart';
import '../../products/product_bindings.dart';
import '../../setup/setup_bindings.dart';
import '../../setup/setup_controller.dart';

class CoreBindings extends Bindings {
  @override
  void dependencies() {
    LoginBindings().dependencies();
    RegisterBindings().dependencies();
    ProductBindings().dependencies();
    SetupBindings().dependencies();

    Get.lazyPut<Storage>(
      () => SessionStorage(),
      fenix: true,
    );
    Get.lazyPut<CustomDio>(
      () => CustomDio(Get.find<Storage>()),
      fenix: true,
    );
    Get.lazyPut<PaymentTypeRepository>(
      () => PaymentTypeRepositoryImpl(Get.find<CustomDio>()),
      fenix: true,
    );
    Get.lazyPut<ProductRepository>(
      () => ProductRepositoryImpl(Get.find<CustomDio>()),
      fenix: true,
    );
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(Get.find<CustomDio>()),
      fenix: true,
    );

    Get.lazyPut(
      () => LoginController(Get.find<AuthService>()),
    );
    Get.lazyPut(
      () => RegisterController(authService: Get.find<AuthService>()),
    );
    Get.lazyPut(
      () => ProductController(Get.find<ProductService>()),
    );
    Get.lazyPut(
      () => ProductDetailController(Get.find<ProductService>()),
    );
    Get.lazyPut(() => SetupController());
  }
}
