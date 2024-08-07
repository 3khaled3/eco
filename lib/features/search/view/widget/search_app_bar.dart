import 'package:eco/utils/Settings_state.dart';
import 'package:eco/utils/box_styles.dart';
import 'package:eco/utils/colors_box.dart';
import 'package:eco/utils/widget/back_button.dart';
import 'package:flutter/material.dart';

import 'filter_dorp_dow.dart';
import 'search_text_faild.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        children: [
          const CustomBackButton(),
          const SizedBox(width: 8),
          Expanded(
            child: SearchTextField(
              onSearchChanged: (value) {},
              onPressedFilter: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return const FilterBottomSheet();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  double _maxPrice = 40.0;
  double _minPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 5,
            width: 100,
            decoration: BoxDecoration(
                color: SettingsCubit().isDarkTheme()
                    ? ColorsBox.white
                    : ColorsBox.black,
                borderRadius: BorderRadius.circular(5555)),
          ),
          const SizedBox(height: 16),
          const Text('Filter By', style: BoxStyles.bold24),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Price', style: BoxStyles.bold16),
              Text('\$$_minPrice-\$$_maxPrice', style: BoxStyles.bold16),
            ],
          ),
          RangeSlider(
            values: RangeValues(_minPrice, _maxPrice),
            // values: RangeValues(0, _maxPrice),
            min: 0,
            max: 80,
            activeColor: ColorsBox.lighterPurple,
            onChanged: (value) {
              setState(() {
                _maxPrice = (value.end).roundToDouble();
                _minPrice = value.start.roundToDouble();
              });
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          FilterDorpDow(
            options: const [
              "default",
              " Sort by rating ",
              "  Sort by popularity ",
              "  Sort by price high to low ",
              "  Sort by price low to high ",
            ],
            selectedOption: "Sort by ",
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Apply filter logic here
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsBox.lighterPurple,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: Center(
              child: Text(
                'Apply Filter',
                style: BoxStyles.bold16.copyWith(color: ColorsBox.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
