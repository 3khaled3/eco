part of 'widget_import.dart';
class ShowAllRow extends StatelessWidget {
  const ShowAllRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(GetTranslation.of(context).topSelling, style: StylesBox.bold16),
        TextButton(
          child:  Text(GetTranslation.of(context).seeAll, style: StylesBox.medium16),
          onPressed: () {},
        )
      ],
    );
  }
}
