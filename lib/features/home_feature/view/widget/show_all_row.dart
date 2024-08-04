part of 'widget_import.dart';
class ShowAllRow extends StatelessWidget {
  const ShowAllRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Top Selling', style: BoxStyles.bold16),
        TextButton(
          child: const Text('see All', style: BoxStyles.medium16),
          onPressed: () {},
        )
      ],
    );
  }
}
