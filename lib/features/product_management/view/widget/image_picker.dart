part of '../pages/add_product.dart';

class ImagePickerWidget extends StatelessWidget {
  /// Callback to pass images to parent
  final Function(List<File?> images) onImagesSelected;

  /// widget to select images from gallery
  const ImagePickerWidget({super.key, required this.onImagesSelected});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<List<File?>> selectedImagesNotifier = ValueNotifier([]);

    return Column(
      children: [
        ///<--- Image Picker button --->///
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width * .5,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(0, 158, 158, 158),
              ),
              child: Material(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    _pickImage(selectedImagesNotifier);
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border:
                              Border.all(color: ColorsBox.black, width: 1.0),
                        ),
                        child: const Icon(Icons.add,
                            color: ColorsBox.black, size: 30),
                      ),
                      const Spacer(),
                      const Text("Add Image", style: StylesBox.regular16),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        ///<--- Image preview grid --->///
        ValueListenableBuilder<List<File?>>(
          valueListenable: selectedImagesNotifier,
          builder: (context, selectedImages, child) {
            onImagesSelected(selectedImages);

            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: selectedImages.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    ///<--- Image preview --->///
                    Positioned.fill(
                      child: Image.file(
                        selectedImages[index]!,
                        fit: BoxFit.cover,
                      ),
                    ),

                    ///<--- remove button --->///
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          final newList = List<File?>.from(selectedImages);
                          newList.removeAt(index);
                          selectedImagesNotifier.value = newList;
                          onImagesSelected(newList);
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  ///<--- Image picker function --->///
  Future<void> _pickImage(
      ValueNotifier<List<File?>> selectedImagesNotifier) async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final pickedFile = File(pickedImage.path);
      selectedImagesNotifier.value = [
        ...selectedImagesNotifier.value,
        pickedFile
      ];

      // Notify parent widget after selecting an image
      onImagesSelected(selectedImagesNotifier.value);
    }
  }
}
