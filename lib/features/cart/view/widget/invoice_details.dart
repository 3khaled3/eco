part of 'widget_import.dart';

class InvoiceDetails extends StatelessWidget {
  const InvoiceDetails({super.key, required this.title, required this.data});
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// <---- sup info  of Invoice title ---->///

          Text(
            title,
            style: StylesBox.regular16.copyWith(
              color: Colors.grey,
            ),
          ),

          /// <---- sup info  of Invoice data ---->///

          Text(
            data,
            style: StylesBox.regular16,
          ),
        ],
      ),
    );
  }
}
