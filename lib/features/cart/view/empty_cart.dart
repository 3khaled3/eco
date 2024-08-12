import 'package:eco/features/search/view/widget/widget_import.dart';
import 'package:eco/utils/box_styles.dart';
import 'package:eco/utils/images.dart';
import 'package:eco/utils/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    //used to make the screen scrollable when device is small
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),

          /// <--------- Empty CART Lottie ---------> ///

          Lottie.asset(AssetsBox.emptyCart, height: 200),

          /// <--------- Empty CART TEXT ---------> ///

          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text(
              GetTranslation.of(context).cartEmpty,
              textAlign: TextAlign.center,
              style: StylesBox.regular24,
            ),
          ),

          /// <--------- EXPLORE CATEGORIES BUTTON ---------> ///

          const ExploreCategoriesButton(),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
        ],
      ),
    );
  }
}
