import 'package:eco/generated/l10n.dart';
import 'package:eco/utils/Settings_state.dart';
import 'package:eco/utils/box_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/home_feature/view/widget/bottom_nav_bar_widget.dart';

void main() {
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
            home: const Home(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GetTranslation.of(context).test,
        ),
      ),
      body: Column(
        children: [
          Text(
            GetTranslation.of(context).test,
            style: BoxStyles.bold32,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => BlocProvider.of<SettingsCubit>(context).toggleLanguage(),
              child: Text(
                'Toggle Theme',
                style: BoxStyles.regular16.copyWith(fontSize: 44),
              ),
            ),
          ),
        ],
      ),
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
