import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:eco/features/product_management/data/repo/product_repo.dart';
import 'package:eco/utils/models/product_model.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());

  final _addProductRepo = ProductRepo();
  Future<void> addProduct(ProductModel product, List<File> images) async {
    emit(AddProductLoading());
    final result = await _addProductRepo.addProduct(product, images);

    result.fold(
      (l) => emit(AddProductError(message: l.message)),
      (r) => emit(AddProductSuccess()),
    );
  }
}
