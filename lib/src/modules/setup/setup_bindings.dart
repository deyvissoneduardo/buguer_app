import 'package:get/get.dart';

import 'setup_controller.dart';

class SetupBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetupController());
  }
}
