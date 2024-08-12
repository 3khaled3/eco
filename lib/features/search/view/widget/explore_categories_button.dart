part of 'widget_import.dart';

class ExploreCategoriesButton extends StatelessWidget {
  const ExploreCategoriesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: const BoxDecoration(
          color: ColorsBox.lighterPurple,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          GetTranslation.of(context).exploreCategories,
          style: StylesBox.regular16.copyWith(color: ColorsBox.white),
        ),
      ),
    );
  }
}
