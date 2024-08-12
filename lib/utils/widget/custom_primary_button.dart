import 'package:eco/utils/box_styles.dart';
import 'package:eco/utils/colors_box.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
    required this.title,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    this.titleStyle,
  });
  final String title;
  final TextStyle? titleStyle;
  final Function() onTap;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Ink(
        padding: padding,
        decoration: const BoxDecoration(
          color: ColorsBox.lighterPurple,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            title,
            style: titleStyle ??
                StylesBox.regular16.copyWith(color: ColorsBox.white),
          ),
        ),
      ),
    );
  }
}
