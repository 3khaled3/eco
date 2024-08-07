import 'package:eco/utils/colors_box.dart';
import 'package:flutter/material.dart';

class CategoryTabBar extends StatefulWidget {
  const CategoryTabBar(
      {super.key, required this.categories, required this.onTap});
  final List<String> categories;
  final Function(String selectedCategory) onTap;

  @override
  // ignore: library_private_types_in_public_api
  _CategoryTabBarState createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: true,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: ColorsBox.lighterPurple,
          ),
          splashBorderRadius: BorderRadius.circular(8),
          splashFactory: NoSplash.splashFactory,
          dividerHeight: 0,
          tabAlignment: TabAlignment.center,
          automaticIndicatorColorAdjustment: false,
          indicatorWeight: 0.1,
          labelPadding: const EdgeInsets.symmetric(horizontal: 4),
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor:Colors.grey ,
          labelColor: ColorsBox.white,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 4),
          onTap: (value) {
            widget.onTap(widget.categories[value]);
          },
          tabs: widget.categories.map((e) {
            return _TabButton(label: e);
          }).toList(),
        ),
      ],
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  const _TabButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(label),
      ),
    );
  }
}
