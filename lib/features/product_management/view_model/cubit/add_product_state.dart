part of 'add_product_cubit.dart';

abstract class AddProductState {
  const AddProductState();
}

class AddProductInitial extends AddProductState {
  List<Object> get props => [];
}

class AddProductLoading extends AddProductState {
  List<Object> get props => [];
}

class AddProductSuccess extends AddProductState {
  List<Object> get props => [];
}

class AddProductError extends AddProductState {
  final String message;

  AddProductError({required this.message});
}
