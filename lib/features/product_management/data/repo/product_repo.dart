import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:eco/utils/models/product_model.dart';

import 'product_service.dart';

///<----  addProduct, fetchProducts, updateProduct, deleteProduct ---->///
class ProductRepo {
  final ProductService _productService = ProductService();

  ///<----  addProduct ---->///
  Future<Either<Failure, void>> addProduct(
      ProductModel product, List<File> images) async {
    return await _productService.addProduct(product, images);
  }

  ///<----  fetchProducts ---->///
  Future<Either<Failure, List<ProductModel>>> fetchProducts() async {
    return await _productService.fetchProducts();
  }

  /// <----  updateProduct ---->///
  Future<Either<Failure, void>> updateProduct(ProductModel product) async {
    return await _productService.updateProduct(product);
  }

  /// <----  deleteProduct ---->///
  Future<Either<Failure, void>> deleteProduct(String productId) async {
    return await _productService.deleteProduct(productId);
  }
}
