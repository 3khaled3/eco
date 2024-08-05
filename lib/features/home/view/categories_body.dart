import 'package:flutter/material.dart';

import 'widget/widget_import.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 10),
        CategoryCard(),
        CategoryCard(),
        CategoryCard(),
        CategoryCard(),
      ],
    );
  }
}
