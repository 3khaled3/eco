import 'package:eco/generated/l10n.dart';
import 'package:eco/utils/Settings_state.dart';
import 'package:eco/utils/box_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Flutter Demo',
            home: const Home(),
          );
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).test,
        ),
      ),
      body: Column(
        children: [
          Text(S.of(context).test, style: BoxStyles.bold32,),
          Center(
            child: ElevatedButton(
              onPressed: () => context.read<SettingsCubit>().toggleTheme(),
              child: Text(
                'Toggle Theme',
                style: BoxStyles.regular16.copyWith(fontSize: 44),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
