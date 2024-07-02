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

class AppLocalization {
  AppLocalization();

  static AppLocalization? _current;

  static AppLocalization get current {
    assert(_current != null,
        'No instance of AppLocalization was loaded. Try to initialize the AppLocalization delegate before accessing AppLocalization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalization();
      AppLocalization._current = instance;

      return instance;
    });
  }

  static AppLocalization of(BuildContext context) {
    final instance = AppLocalization.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalization present in the widget tree. Did you add AppLocalization.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalization? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  /// `Добро пожаловать`
  String get welcome {
    return Intl.message(
      'Добро пожаловать',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Парол`
  String get password {
    return Intl.message(
      'Парол',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get log_in {
    return Intl.message(
      'Войти',
      name: 'log_in',
      desc: '',
      args: [],
    );
  }

  /// `Регистрироваться`
  String get register {
    return Intl.message(
      'Регистрироваться',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Чаты`
  String get chats {
    return Intl.message(
      'Чаты',
      name: 'chats',
      desc: '',
      args: [],
    );
  }

  /// `Поиск`
  String get search {
    return Intl.message(
      'Поиск',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Сообщение`
  String get massage {
    return Intl.message(
      'Сообщение',
      name: 'massage',
      desc: '',
      args: [],
    );
  }

  /// `Открыть камеру`
  String get open_camera {
    return Intl.message(
      'Открыть камеру',
      name: 'open_camera',
      desc: '',
      args: [],
    );
  }

  /// `Выбрать из галереи`
  String get select_from_gallery {
    return Intl.message(
      'Выбрать из галереи',
      name: 'select_from_gallery',
      desc: '',
      args: [],
    );
  }

  /// `Неправильный пароль`
  String get wrong_password {
    return Intl.message(
      'Неправильный пароль',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `неверный адрес электронной почты`
  String get invalid_email {
    return Intl.message(
      'неверный адрес электронной почты',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Отключен пользователем`
  String get user_disabled {
    return Intl.message(
      'Отключен пользователем',
      name: 'user_disabled',
      desc: '',
      args: [],
    );
  }

  /// `Пользователь не найден`
  String get user_not_found {
    return Intl.message(
      'Пользователь не найден',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Этот электронный адрес уже занят`
  String get email_already_exist {
    return Intl.message(
      'Этот электронный адрес уже занят',
      name: 'email_already_exist',
      desc: '',
      args: [],
    );
  }

  /// `Слабый пароль`
  String get weak_password {
    return Intl.message(
      'Слабый пароль',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }

  /// `Вставьте другой адрес электронной почты`
  String get input_another_email {
    return Intl.message(
      'Вставьте другой адрес электронной почты',
      name: 'input_another_email',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);
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
