import 'package:eco/utils/extensions.dart';
import 'package:flutter/material.dart';

import 'widget/widget_import.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ImageSlider(),
        8.ph,
        const HomeProductBuilder(categoryTitle: "New Arrivals"),
        const HomeProductBuilder(categoryTitle: "Top Selling"),
      ],
    );
  }
}
