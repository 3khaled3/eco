import 'dart:io';
import 'package:eco/features/product_management/view_model/cubit/add_product_cubit.dart';
import 'package:eco/utils/box_styles.dart';
import 'package:eco/utils/colors_box.dart';
import 'package:eco/utils/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part '../widget/drowp_down_widget.dart';
part '../widget/image_picker.dart';
part '../widget/text_faild_widet.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = '/add_product';

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController stockController = TextEditingController();
    final TextEditingController ratingController = TextEditingController();
    final TextEditingController viewsController = TextEditingController();
    final List<File?> selectedImages = [];
    final ValueNotifier<String?> selectedCategory = ValueNotifier(null);
    final List<String> categories = [
      'Electronics',
      'Clothing',
      'Home & Kitchen',
      'Books',
      'Toys',
      'Others',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        backgroundColor: Colors.blueGrey,
      ),
      body: BlocBuilder<AddProductCubit, AddProductState>(
        builder: (context, state) {
          if (state is AddProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AddProductError) {
            return Center(child: Text(state.message));
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('Add New Product', style: StylesBox.bold24),
                    const SizedBox(height: 20),
                    TextFelidWidget(
                      controller: nameController,
                      label: 'Name',
                      hint: 'Enter product name',
                    ),
                    TextFelidWidget(
                      controller: descriptionController,
                      label: 'Description',
                      hint: 'Enter product description',
                      maxLines: 3,
                    ),
                    TextFelidWidget(
                      controller: priceController,
                      label: 'Price',
                      hint: 'Enter product price',
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                    ),
                    ValueListenableBuilder<String?>(
                        valueListenable: selectedCategory,
                        builder: (context, value, child) {
                          return DropdownField(
                            value: selectedCategory.value,
                            items: categories,
                            onChanged: (newValue) {
                              selectedCategory.value = newValue;
                            },
                            label: 'Category',
                            hint: 'Select product category',
                          );
                        }),
                    TextFelidWidget(
                      controller: stockController,
                      label: 'Stock',
                      hint: 'Enter stock quantity',
                      keyboardType: TextInputType.number,
                    ),
                    TextFelidWidget(
                      controller: ratingController,
                      label: 'Rating',
                      hint: 'Enter product rating',
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                    ),
                    TextFelidWidget(
                      controller: viewsController,
                      label: 'Views',
                      hint: 'Enter number of views',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    ImagePickerWidget(
                      onImagesSelected: (images) {
                        selectedImages.clear();
                        selectedImages.addAll(images);
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState?.validate() ?? false) {
                          try {
                            final product = ProductModel(
                              id: '',
                              name: nameController.text,
                              description: descriptionController.text,
                              price: double.parse(priceController.text),
                              category: selectedCategory.value ?? '',
                              stock: int.parse(stockController.text),
                              imageUrls: [],
                              rating: double.parse(ratingController.text),
                              views: int.parse(viewsController.text),
                            );

                            await BlocProvider.of<AddProductCubit>(context)
                                .addProduct(product,
                                    selectedImages.whereType<File>().toList());

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Product added successfully')),
                            );

                            formKey.currentState?.reset();
                          } catch (e) {
                            if (kDebugMode) {
                              print("!!!!!!! Error :${e.toString()}");
                            }
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: const Text('Add Product'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
