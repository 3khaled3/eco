import 'package:eco/features/Profil/view/profil_view.dart';
import 'package:eco/features/product_management/view_model/cubit/add_product_cubit.dart';
import 'package:eco/features/cart/view/cart_view.dart';
import 'package:eco/features/home/view/home_view.dart';
import 'package:eco/features/home/view/widget/bottom_nav_bar_widget.dart';
import 'package:eco/features/authentication/view/pages/login_view.dart';
import 'package:eco/features/authentication/view/pages/register_view.dart';
import 'package:eco/features/search/view/search_empty.dart';
import 'package:eco/features/search/view/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'features/product_management/view/pages/add_product.dart';

abstract class AppRoutes {
  static const String kHomeRoute = HomeView.routeName;
  static const String kLoginRoute = LoginView.routeName;
  static const String kRegisterRoute = RegisterView.routeName;
  static const String kCartRoute = CartView.routeName;
  static const String kProfileRoute = ProfileView.routeName;
  static const String kSearchRoute = SearchView.routeName;
  static const String kAddProductRoute = AddProductView.routeName;

// Define your GoRouter
  static GoRouter router = GoRouter(
    // initialLocation: kLoginRoute,
    initialLocation: kAddProductRoute,
    routes: [
      GoRoute(
        path: kLoginRoute,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: kAddProductRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => AddProductCubit(),
          child: AddProductView(),
        ),
      ),
      GoRoute(
        path: kRegisterRoute,
        builder: (context, state) => RegisterView(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return ScaffoldWithBottomNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: kHomeRoute,
            builder: (context, state) => HomeView(),
          ),
          GoRoute(
            path: kCartRoute,
            builder: (context, state) => CartView(),
          ),
          GoRoute(
            path: kProfileRoute,
            builder: (context, state) => ProfileView(),
          ),
          GoRoute(
            path: kSearchRoute,
            builder: (context, state) => SearchEmpty(),
          ),
        ],
      ),
    ],
  );
}
