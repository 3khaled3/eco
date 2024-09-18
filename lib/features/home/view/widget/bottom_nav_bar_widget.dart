import 'package:eco/go_router.dart';
import 'package:eco/utils/colors_box.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBottomNavBar extends StatelessWidget {
  const ScaffoldWithBottomNavBar({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _getSelectedIndex(context),
        onTap: (index) {
          _onItemTapped(index, context);
        },
        selectedItemColor: ColorsBox.lighterPurple,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'shopping_cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith(AppRoutes.kHomeRoute)) {
      return 0;
    }
    if (location.startsWith(AppRoutes.kSearchRoute)) {
      return 1;
    }
    if (location.startsWith(AppRoutes.kCartRoute)) {
      return 2;
    }
    if (location.startsWith(AppRoutes.kProfileRoute)) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(AppRoutes.kHomeRoute);
        break;
      case 1:
        context.go(AppRoutes.kSearchRoute);
        break;
      case 2:
        context.go(AppRoutes.kCartRoute);
        break;
      case 3:
        context.go(AppRoutes.kProfileRoute);
        break;
    }
  }
}
