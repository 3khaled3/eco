import 'package:eco/features/search/view/widget/explore_categories_button.dart';
import 'package:eco/utils/box_styles.dart';
import 'package:eco/utils/images.dart';
import 'package:eco/utils/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
          Lottie.asset(AssetsBox.emptyCart, height: 200),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text(
              GetTranslation.of(context).cartEmpty,
              textAlign: TextAlign.center,
              style: BoxStyles.regular24,
            ),
          ),
          const ExploreCategoriesButton(),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
        ],
      ),
    );
  }
}
