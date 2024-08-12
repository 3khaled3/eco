part of 'widget_import.dart';
class HomeProductBuilder extends StatelessWidget {
  const HomeProductBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ShowAllRow(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ProductCard(), ProductCard()],
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ProductCard(), ProductCard()],
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
