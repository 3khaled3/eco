import 'package:eco/utils/Settings_state.dart';
import 'package:eco/utils/box_styles.dart';
import 'package:eco/utils/images.dart';
import 'package:eco/utils/localization/generated/l10n.dart';
import 'package:eco/utils/widget/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'widget/widget_import.dart';

class SearchEmpty extends StatelessWidget {
  const SearchEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (BuildContext context, setState) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SearchAppBar(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                      SettingsCubit().isDarkTheme()
                          ? AssetsBox.searchLottieDark
                          : AssetsBox.searchLottieLight,
                      height: 150),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Text(
                      GetTranslation.of(context).searchEmpty,
                      textAlign: TextAlign.center,
                      style: StylesBox.regular24,
                    ),
                  ),
                  CustomPrimaryButton(
                    title: GetTranslation.of(context).exploreCategories,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
          ],
        ),
      );
    });
  }
}
