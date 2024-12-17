import 'package:flutter/material.dart';

import 'widget/widget_import.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ImageSlider(),
        SizedBox(height: 8),
        HomeProductBuilder(categoryTitle: "New Arrivals"),
        HomeProductBuilder(categoryTitle: "Top Selling"),
      ],
    );
  }
}
