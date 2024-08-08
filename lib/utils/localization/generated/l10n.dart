// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class GetTranslation {
  GetTranslation();

  static GetTranslation? _current;

  static GetTranslation get current {
    assert(_current != null,
        'No instance of GetTranslation was loaded. Try to initialize the GetTranslation delegate before accessing GetTranslation.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<GetTranslation> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = GetTranslation();
      GetTranslation._current = instance;

      return instance;
    });
  }

  static GetTranslation of(BuildContext context) {
    final instance = GetTranslation.maybeOf(context);
    assert(instance != null,
        'No instance of GetTranslation present in the widget tree. Did you add GetTranslation.delegate in localizationsDelegates?');
    return instance!;
  }

  static GetTranslation? maybeOf(BuildContext context) {
    return Localizations.of<GetTranslation>(context, GetTranslation);
  }

  /// `test en`
  String get test {
    return Intl.message(
      'test en',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `new en`
  String get neww {
    return Intl.message(
      'new en',
      name: 'neww',
      desc: '',
      args: [],
    );
  }

  /// `see all`
  String get seeAll {
    return Intl.message(
      'see all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `product name`
  String get productName {
    return Intl.message(
      'product name',
      name: 'productName',
      desc: '',
      args: [],
    );
  }

  /// `top selling`
  String get topSelling {
    return Intl.message(
      'top selling',
      name: 'topSelling',
      desc: '',
      args: [],
    );
  }

  /// ` Welcome`
  String get welcome {
    return Intl.message(
      ' Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `start shopping now`
  String get startShopping {
    return Intl.message(
      'start shopping now',
      name: 'startShopping',
      desc: '',
      args: [],
    );
  }

  /// `explore categories`
  String get exploreCategories {
    return Intl.message(
      'explore categories',
      name: 'exploreCategories',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, we couldn't find any matching result for your Search.`
  String get searchEmpty {
    return Intl.message(
      'Sorry, we couldn\'t find any matching result for your Search.',
      name: 'searchEmpty',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Your Cart is Empty`
  String get cartEmpty {
    return Intl.message(
      'Your Cart is Empty',
      name: 'cartEmpty',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<GetTranslation> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<GetTranslation> load(Locale locale) => GetTranslation.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
