part of 'widget_import.dart';

class HomeProductBuilder extends StatelessWidget {
  const HomeProductBuilder({super.key, required this.categoryTitle});
  final String categoryTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShowAllRow(title: categoryTitle),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ProductCard(), ProductCard()],
        ),
        10.ph,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProductCard(),
            ProductCard(),
          ],
        ),
        Align(
          alignment: AlignmentDirectional.center,
          child: TextButton(
            onPressed: () {},
            child: const Text("see more", style: StylesBox.bold16),
          ),
        ),
      ],
    );
  }
}
