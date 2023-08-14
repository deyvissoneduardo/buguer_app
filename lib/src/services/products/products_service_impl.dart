import 'dart:typed_data';

import 'package:burguer_app/src/models/product_model.dart';
import 'package:burguer_app/src/repositories/products/products_repository.dart';
import 'package:burguer_app/src/services/products/products_service.dart';

class ProductsServiceImpl implements ProductService {
  final ProductRepository productRepository;

  ProductsServiceImpl(this.productRepository);

  @override
  Future<void> deleteProduct(int id) => productRepository.deleteProduct(id);

  @override
  Future<List<ProductModel>> finalAll(String? name) =>
      productRepository.finalAll(name);

  @override
  Future<ProductModel> getProduct(int id) => productRepository.getProduct(id);

  @override
  Future<void> save(ProductModel productModel) =>
      productRepository.save(productModel);

  @override
  Future<String> uploadImageProduct(Uint8List file, String filename) =>
      productRepository.uploadImageProduct(file, filename);
}
