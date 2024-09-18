import 'package:eco/features/Profil/view/profil_view.dart';
import 'package:eco/features/cart/view/cart_view.dart';
import 'package:eco/features/home/view/home_view.dart';
import 'package:eco/features/home/view/widget/bottom_nav_bar_widget.dart';
import 'package:eco/features/login/view/login_view.dart';
import 'package:eco/features/login/view/register_view.dart';
import 'package:eco/features/search/view/search_empty.dart';
import 'package:eco/features/search/view/search_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const String kHomeRoute = HomeView.routeName;
  static const String kLoginRoute = LoginView.routeName;
  static const String kRegisterRoute = RegisterView.routeName;
  static const String kCartRoute = CartView.routeName;
  static const String kProfileRoute = ProfileView.routeName;
  static const String kSearchRoute = SearchView.routeName;

// Define your GoRouter
  static GoRouter router = GoRouter(
    initialLocation: kLoginRoute,
    routes: [
      GoRoute(
        path: kLoginRoute,
        builder: (context, state) => LoginView(),
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
