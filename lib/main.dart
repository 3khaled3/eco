import 'package:eco/features/Profil/view/profil_view.dart';
import 'package:eco/features/home/view/home_view.dart';
import 'package:eco/features/login/view/login_view.dart';
import 'package:eco/utils/localization/generated/l10n.dart';
import 'package:eco/utils/Settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'features/cart/view/cart_view.dart';
import 'features/home/view/widget/widget_import.dart';
import 'features/login/view/register_view.dart';
import 'features/search/view/search_empty.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SettingsCubit()),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.theme,
            locale: state.locale,
            localizationsDelegates: const [
              GetTranslation.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: GetTranslation.delegate.supportedLocales,
            title: 'Flutter Demo',
            home: const RegisterView(),
          );
        },
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;
  List<Widget> pages = [
    const HomeView(),
    const SearchEmpty(),
    const CartView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[currentPageIndex]),
      bottomNavigationBar: BottomNavBarWidget(
        currentPageIndex: currentPageIndex,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
