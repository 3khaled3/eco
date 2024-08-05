import 'package:eco/features/search/view/widget/tab_bar.dart';
import 'package:eco/utils/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBarWidget(
              categories: [
                GetTranslation.of(context).startShopping,
                GetTranslation.of(context).productName,
                GetTranslation.of(context).test,
                GetTranslation.of(context).startShopping,
                GetTranslation.of(context).seeAll,
                GetTranslation.of(context).welcome,
                GetTranslation.of(context).productName,
              ],
              onTap: (selectedCategory) {
                print(selectedCategory);
              },
            )
          ],
        ),
      ),
    );
  }
}
