import 'dart:developer';

import 'package:get/get.dart';

import '../../../models/product_model.dart';
import '../../../services/products/products_service.dart';

class ProductController extends GetxController {
  final ProductService productService;

  final errorMessage = Rx<String?>('');
  final filterName = Rx<String?>('');
  final isLoading = false.obs;

  var products = <ProductModel>[].obs;
  ProductModel? productSelected;

  ProductController(this.productService);

  Future<void> filterByName(String name) async {
    filterName.value = name;
    await loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      isLoading.value = !isLoading.value;
      products.value = await productService.finalAll(filterName.value);
      isLoading.value = !isLoading.value;
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      isLoading.value = !isLoading.value;
    }
  }

  Future<void> addProduct() async {
    isLoading.value = !isLoading.value;
    await Future.delayed(Duration.zero);
    productSelected = null;
    isLoading.value = !isLoading.value;
  }

  Future<void> editProduct(ProductModel productModel) async {
    isLoading.value = !isLoading.value;
    await Future.delayed(Duration.zero);
    productSelected = productModel;
    isLoading.value = !isLoading.value;
  }
}
