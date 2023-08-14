import 'package:get/get.dart';

import '../../../core/rest_client/custom_dio.dart';
import '../../../core/storage/storege.dart';
import '../../../repositories/auth/auth_repository.dart';
import '../../../repositories/auth/auth_repository_impl.dart';
import '../../../services/auth/auth_service.dart';
import '../../../services/auth/auth_service_impl.dart';
import 'register_controller.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(Get.find<CustomDio>()),
    );
    Get.lazyPut<AuthService>(
      () => AuthServiceImpl(
        authRepository: Get.find<AuthRepository>(),
        storage: Get.find<Storage>(),
      ),
    );
    Get.lazyPut(
      () => RegisterController(
        authService: Get.find<AuthService>(),
      ),
    );
  }
}
