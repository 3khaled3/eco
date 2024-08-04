part of 'home_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ImageSlider(),
        ShowAllRow(),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ProductCard(), ProductCard()]),
        SizedBox(height: 10),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ProductCard(), ProductCard()]),
             SizedBox(height: 10),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ProductCard(), ProductCard()]),
      ],
    );
  }
}
