import 'package:eco/utils/box_styles.dart';
import 'package:eco/utils/colors_box.dart';
import 'package:eco/utils/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

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
          style: BoxStyles.regular16.copyWith(color: ColorsBox.white),
        ),
      ),
    );
  }
}
