part of '../pages/add_product.dart';

class DropdownField extends StatelessWidget {
  const DropdownField({
    super.key,
    this.value,
    required this.items,
    required this.onChanged,
    required this.label,
    required this.hint,
  });

  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
        ),
        items: items.map((category) {
          return DropdownMenuItem<String>(
            value: category,
            child: Text(category),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) {
          if (value == null) {
            return 'Please select a $label';
          }
          return null;
        },
      ),
    );
  }
}
