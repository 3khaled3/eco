import 'package:eco/features/home/view/widget/widget_import.dart';
import 'package:eco/utils/box_styles.dart';
import 'package:eco/utils/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'widget/widget_import.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    // String? currentCategory;
    final List<String> categories = [
      GetTranslation.of(context).startShopping,
      GetTranslation.of(context).productName,
      GetTranslation.of(context).test,
      GetTranslation.of(context).startShopping,
      GetTranslation.of(context).seeAll,
      GetTranslation.of(context).welcome,
      GetTranslation.of(context).productName,
    ];
    // currentCategory = categories.first;
    return StatefulBuilder(builder: (BuildContext context, setState) {
      return ListView(
        children: [
          const SearchAppBar(),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 8),
            child: CategoryTabBar(
              categories: categories,
              onTap: (selectedCategory) {
                // currentCategory = selectedCategory;
                setState(() {});
                print(selectedCategory);
              },
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text("result found", style: StylesBox.bold16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ProductCard(), ProductCard()],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ProductCard(), ProductCard()],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ProductCard(), ProductCard()],
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
