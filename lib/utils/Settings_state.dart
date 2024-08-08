import 'package:eco/utils/colors_box.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

class SettingsState {
  final Locale locale;
  final ThemeData theme;

  SettingsState({required this.locale, required this.theme});
}

class SettingsCubit extends Cubit<SettingsState> {
  static final SettingsCubit _singleton = SettingsCubit._internal();

  factory SettingsCubit() {
    return _singleton;
  }

  SettingsCubit._internal()
      : super(SettingsState(
          locale: const Locale('en'),
          theme: _getLightTheme('en'),
        ));

  bool isDarkTheme() => state.theme.brightness == Brightness.dark;

  static ThemeData _getLightTheme(String lang) {
    return ThemeData(
      fontFamily: lang == 'en' ? 'Montserrat' : 'NotoKufiArabic',
      primaryColor: ColorsBox.lighterPurple,
      scaffoldBackgroundColor: ColorsBox.white,
      colorScheme: const ColorScheme.light().copyWith(
        brightness: Brightness.light,
        secondary: ColorsBox.whiteTwo,
        secondaryFixed: ColorsBox.black,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData _getDarkTheme(String lang) {
    return ThemeData(
      fontFamily: lang == 'en' ? 'Montserrat' : 'NotoKufiArabic',
      colorScheme: const ColorScheme.dark().copyWith(
        secondary: ColorsBox.darkTwo,
        secondaryFixed: ColorsBox.white,
        brightness: Brightness.dark,
      ),
      primaryColor: ColorsBox.lighterPurple,
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
