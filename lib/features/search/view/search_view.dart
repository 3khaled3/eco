import 'package:eco/features/search/view/widget/search_text_faild.dart';
import 'package:eco/features/search/view/widget/tab_bar.dart';
import 'package:eco/utils/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    String? currentCategory;
    final List<String> categories = [
      GetTranslation.of(context).startShopping,
      GetTranslation.of(context).productName,
      GetTranslation.of(context).test,
      GetTranslation.of(context).startShopping,
      GetTranslation.of(context).seeAll,
      GetTranslation.of(context).welcome,
      GetTranslation.of(context).productName,
    ];
    currentCategory = categories.first;
    return StatefulBuilder(builder: (BuildContext context, setState) {
      return Column(
        children: [
          SearchTextField(onSearchChanged: (value) {
            print(value);
          }),
          TabBarWidget(
            categories: categories,
            onTap: (selectedCategory) {
              currentCategory = selectedCategory;
              setState(() {});
              print(selectedCategory);
            },
          ),
          Expanded(
            child: Center(
              child: Text(currentCategory!),
            ),
          ),
        ],
      );
    });
  }
}
