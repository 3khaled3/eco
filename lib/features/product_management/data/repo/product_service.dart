import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:dartz/dartz.dart';
import 'dart:io';
import 'package:eco/utils/models/product_model.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final String _productsCollection = 'products';

  ///<---- Method to upload images to Firebase Storage and return their URLs ---->///
  Future<List<String>> uploadImages(List<File> images) async {
    List<String> imageUrls = [];

    try {
      for (File image in images) {
        String originalFileName = image.path.split('/').last;

        ///<-- Generate a unique file name -->///
        String uniqueFileName = '${const Uuid().v4()}_$originalFileName';
        Reference storageRef =
            _firebaseStorage.ref().child('product_images/$uniqueFileName');

        final uploadTask = await storageRef.putFile(image);
        String downloadUrl = await uploadTask.ref.getDownloadURL();

        /// <-- Add the image URL to the list --->///
        imageUrls.add(downloadUrl);
      }
    } catch (e) {
      throw Exception('Error uploading images: $e');
    }

    return imageUrls;
  }

  ///<---- Add product to the database -->///
  Future<Either<Failure, void>> addProduct(
      ProductModel product, List<File> images) async {
    try {
      /// <-- Upload images to Firebase Storage -->///
      List<String> imageUrls = await uploadImages(images);

      /// <-- Generate a new document ID -->///
      DocumentReference docRef =
          _firestore.collection(_productsCollection).doc();
      ProductModel updateProduct =
          product.copyWith(id: docRef.id, imageUrls: imageUrls);

      /// <-- Add the product to the database -->///
      await docRef.set(updateProduct.toMap());

      /// <-- Return a successful result -->///
      return right(null);
    } catch (e) {
      /// <-- Left signifies failure -->///
      return left(Failure('Error adding product: $e'));
    }
  }

  /// <-- Fetch products from the database -->///
  Future<Either<Failure, List<ProductModel>>> fetchProducts() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection(_productsCollection).get();
      List<ProductModel> products = snapshot.docs.map((doc) {
        return ProductModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();

      /// <-- Successful result -->///
      return right(products);
    } catch (e) {
      return left(Failure('Error fetching products: $e'));
    }
  }

  ///<---- Update product in the database -->///
  Future<Either<Failure, void>> updateProduct(ProductModel product) async {
    try {
      await _firestore
          .collection(_productsCollection)
          .doc(product.id)
          .update(product.toMap());
      return right(null);
    } catch (e) {
      return left(Failure('Error updating product: $e'));
    }
  }

  /// <-- Delete product from the database -->///
  Future<Either<Failure, void>> deleteProduct(String productId) async {
    try {
      await _firestore.collection(_productsCollection).doc(productId).delete();
      return right(null);
    } catch (e) {
      return left(Failure('Error deleting product: $e'));
    }
  }
}

class Failure {
  final String message;

  Failure(this.message);
}
