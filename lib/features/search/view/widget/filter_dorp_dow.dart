import 'package:eco/utils/Settings_state.dart';
import 'package:eco/utils/box_styles.dart';
import 'package:eco/utils/colors_box.dart';
import 'package:flutter/material.dart';

class FilterDorpDow extends StatelessWidget {
  const FilterDorpDow({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onChanged,
  });

  final List<String> options;

  final String selectedOption;

  final void Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    bool show = false;
    String? selected = selectedOption;

    return StatefulBuilder(builder: (context, setState) {
      return Container(
        decoration: BoxDecoration(
          color: SettingsCubit().isDarkTheme()
              ? ColorsBox.black
              : ColorsBox.white50,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  show = !show;
                });
              },
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selected != ""
                          ? selected!
                          : options.isEmpty
                              ? 'noAppointment'
                              : 'selectAppointment',
                      style: StylesBox.bold16,
                    ),
                    Icon(
                      show
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      color: ColorsBox.lighterPurple,
                    ),
                  ],
                ),
              ),
            ),
            if (show) ...[
              Container(
                color: Theme.of(context).colorScheme.secondary,
                height: 2,
              ),
              ...options.map(
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = index;
                      show = !show;
                    });
                    onChanged(selected);
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Text(
                      //call formatTime function here
                      index,
                      style: StylesBox.regular16.copyWith(
                        color: selected == index
                            ? ColorsBox.lighterPurple
                            : SettingsCubit().isDarkTheme()
                                ? ColorsBox.whiteTwo
                                : ColorsBox.black50,
                      ),
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      );
    });
  }
}
