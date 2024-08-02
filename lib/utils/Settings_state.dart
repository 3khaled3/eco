import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

class SettingsState {
  final Locale locale;
  final ThemeData theme;

  SettingsState({required this.locale, required this.theme});
}

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(SettingsState(
          locale: const Locale('en'),
          theme: _getLightTheme('en'),
        ));

  static ThemeData _getLightTheme(String lang) {
    return ThemeData(
      fontFamily: lang == 'en' ? 'Montserrat' : 'NotoKufiArabic',
      brightness: Brightness.light,
      primaryColor: Colors.purple,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData _getDarkTheme(String lang) {
    return ThemeData(
      fontFamily: lang == 'en' ? 'Montserrat' : 'NotoKufiArabic',
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
    );
  }

  void toggleLanguage() {
    final newLocale = state.locale.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');
    final newTheme = state.theme.brightness == Brightness.light
        ? _getLightTheme(newLocale.languageCode)
        : _getDarkTheme(newLocale.languageCode);
    emit(SettingsState(locale: newLocale, theme: newTheme));
  }

  void toggleTheme() {
    final newTheme = state.theme.brightness == Brightness.dark
        ? _getLightTheme(state.locale.languageCode)
        : _getDarkTheme(state.locale.languageCode);
    emit(SettingsState(locale: state.locale, theme: newTheme));
  }
}
