import 'package:eco/utils/box_styles.dart';
import 'package:eco/utils/colors_box.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    this.titleStyle,
  });
  final String title;
  final TextStyle? titleStyle;
  final Function() onTap;
  final EdgeInsetsGeometry padding;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Ink(
        padding: padding,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(
              title,
              style: titleStyle ??
                  StylesBox.regular16.copyWith(color: ColorsBox.white),
            ),
          ],
        ),
      ),
    );
  }
}
