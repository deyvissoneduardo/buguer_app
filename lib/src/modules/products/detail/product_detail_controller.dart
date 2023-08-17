import 'dart:developer';
import 'dart:typed_data';

import 'package:get/get.dart';

import '../../../models/product_model.dart';
import '../../../services/products/products_service.dart';

class ProductDetailController extends GetxController {
  final ProductService productService;

  final errorMessage = Rx<String?>('');
  final imagePath = Rx<String?>('');
  final isLoading = false.obs;

  ProductModel? productModel;

  ProductDetailController(this.productService);

  Future<void> uploadImageProduct(Uint8List file, String fileName) async {
    isLoading.value = !isLoading.value;
    try {
      imagePath.value = await productService.uploadImageProduct(file, fileName);
      isLoading.value = !isLoading.value;
    } catch (e, s) {
      log('Erro ao fazer upload da imagem', error: e, stackTrace: s);
      errorMessage.value = 'Erro ao fazer upload da imagem';
      isLoading.value = !isLoading.value;
    }
  }

  Future<void> save(
    String name,
    double price,
    String description,
  ) async {
    isLoading.value = !isLoading.value;
    try {
      await productService.save(
        ProductModel(
          id: productModel?.id,
          name: name,
          description: description,
          price: price,
          image: imagePath.value!,
          enabled: productModel?.enabled ?? true,
        ),
      );
      isLoading.value = !isLoading.value;
    } catch (e, s) {
      log('Erro ao salvar produto', error: e, stackTrace: s);
      isLoading.value = !isLoading.value;
      errorMessage.value = 'Erro ao salvar o produto';
    }
  }

  Future<void> loadProduct(int? id) async {
    try {
      isLoading.value = !isLoading.value;
      productModel = null;
      imagePath.value = null;
      if (id != null) {
        productModel = await productService.getProduct(id);
        imagePath.value = productModel!.image;
      }
      isLoading.value = !isLoading.value;
    } catch (e, s) {
      log('Erro ao carregar produto', error: e, stackTrace: s);
      isLoading.value = !isLoading.value;
    }
  }

  Future<void> deleteProduct() async {
    try {
      isLoading.value = !isLoading.value;

      if (productModel != null && productModel!.id != null) {
        await productService.deleteProduct(productModel!.id!);
        isLoading.value = !isLoading.value;
      }
    } catch (e, s) {
      log('Erro ao deletar produto', error: e, stackTrace: s);
      isLoading.value = !isLoading.value;
      errorMessage.value = 'Erro ao deletar produto';
    }
  }
}
