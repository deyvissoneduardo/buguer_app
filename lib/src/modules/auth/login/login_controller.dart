import 'dart:developer';

import 'package:get/get.dart';

import '../../../core/exception/unauthorized_exception.dart';
import '../../../services/auth/auth_service.dart';
import '../../core/routes/app_routes.dart';

class LoginController extends GetxController {
  final AuthService _authService;

  final errorMessage = Rx<String?>(null);
  final isLoading = false.obs;
  LoginController(this._authService);

  Future<void> login(String cpf, String password) async {
    try {
      isLoading.value = true;
      await _authService.execute(cpf: cpf, password: password);
      await Get.offAndToNamed(AppRoutes.HOME_PAGE);
      isLoading.value = false;
    } on UnauthorizedException {
      isLoading.value = false;
      errorMessage.value = 'Login ou senha inválidos';
    } catch (e, s) {
      isLoading.value = false;
      log('Erro ao realizar login', error: e, stackTrace: s);
      errorMessage.value = 'Tente novamente mais tarde';
    }
  }
}
