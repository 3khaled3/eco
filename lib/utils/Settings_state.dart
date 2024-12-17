// import 'package:eco/features/authentication/data/user_model.dart';
// import 'package:eco/utils/colors_box.dart';
// import 'package:flutter/material.dart';
// import 'package:bloc/bloc.dart';

// class SettingsState {
//   final Locale locale;
//   final ThemeData theme;
//   final UserModel? user; // User can now be null

//   SettingsState({
//     required this.locale,
//     required this.theme,
//     this.user, // Allow user to be optional
//   });

//   // Create a copyWith method to allow easy state updates
//   SettingsState copyWith({
//     Locale? locale,
//     ThemeData? theme,
//     UserModel? user,
//   }) {
//     return SettingsState(
//       locale: locale ?? this.locale,
//       theme: theme ?? this.theme,
//       user: user ?? this.user,
//     );
//   }
// }

// class SettingsCubit extends Cubit<SettingsState> {
//   static final SettingsCubit _singleton = SettingsCubit._internal();

//   factory SettingsCubit() {
//     return _singleton;
//   }

//   SettingsCubit._internal()
//       : super(
//           SettingsState(
//             locale: const Locale('en'),
//             theme: _getLightTheme('en'),
//             user: null, // Initially null user
//           ),
//         );

//   bool isDarkTheme() => state.theme.brightness == Brightness.dark;

//   static ThemeData _getLightTheme(String lang) {
//     return ThemeData(
//       fontFamily: lang == 'en' ? 'Montserrat' : 'NotoKufiArabic',
//       primaryColor: ColorsBox.lighterPurple,
//       scaffoldBackgroundColor: ColorsBox.white,
//       colorScheme: const ColorScheme.light().copyWith(
//         brightness: Brightness.light,
//         secondary: ColorsBox.whiteTwo,
//         secondaryFixed: ColorsBox.black,
//       ),
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//     );
//   }

//   static ThemeData _getDarkTheme(String lang) {
//     return ThemeData(
//       fontFamily: lang == 'en' ? 'Montserrat' : 'NotoKufiArabic',
//       colorScheme: const ColorScheme.dark().copyWith(
//         secondary: ColorsBox.darkTwo,
//         secondaryFixed: ColorsBox.white,
//         brightness: Brightness.dark,
//       ),
//       primaryColor: ColorsBox.lighterPurple,
//     );
//   }

//   // Getter for user
//   UserModel? get user => state.user;

//   // Setter for user
//   void setUser(UserModel? newUser) {
//     emit(state.copyWith(user: newUser));
//   }

//   void toggleLanguage() {
//     final newLocale = state.locale.languageCode == 'en'
//         ? const Locale('ar')
//         : const Locale('en');
//     final newTheme = state.theme.brightness == Brightness.light
//         ? _getLightTheme(newLocale.languageCode)
//         : _getDarkTheme(newLocale.languageCode);
//     emit(state.copyWith(locale: newLocale, theme: newTheme));
//   }

//   void toggleTheme() {
//     final newTheme = state.theme.brightness == Brightness.dark
//         ? _getLightTheme(state.locale.languageCode)
//         : _getDarkTheme(state.locale.languageCode);
//     emit(state.copyWith(theme: newTheme));
//   }
// }
