import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../template/base_layout.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    controller.loadProducts();
    print('************************************');
    print(controller.products);

    return BaseLayout(
      body: ListView.builder(
        itemCount: controller.products.length,
        itemBuilder: (context, index) => Container(
          color: Colors.amber,
          child: Text('${controller.products[index]}'),
        ),
      ),
    );
  }
}
