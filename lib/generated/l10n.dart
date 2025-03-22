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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Scan a QR code to save the information.`
  String get addCode {
    return Intl.message(
      'Scan a QR code to save the information.',
      name: 'addCode',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Turn on flash`
  String get turnFlash {
    return Intl.message(
      'Turn on flash',
      name: 'turnFlash',
      desc: '',
      args: [],
    );
  }

  /// `Scanning QR Code`
  String get scanningCode {
    return Intl.message(
      'Scanning QR Code',
      name: 'scanningCode',
      desc: '',
      args: [],
    );
  }

  /// `Place the QR code inside the frame`
  String get placeQrInFrame {
    return Intl.message(
      'Place the QR code inside the frame',
      name: 'placeQrInFrame',
      desc: '',
      args: [],
    );
  }

  /// `No codes scanned yet`
  String get noCodes {
    return Intl.message(
      'No codes scanned yet',
      name: 'noCodes',
      desc: '',
      args: [],
    );
  }

  /// `Scan Code`
  String get scancode {
    return Intl.message(
      'Scan Code',
      name: 'scancode',
      desc: '',
      args: [],
    );
  }

  /// `Authentication`
  String get authTitle {
    return Intl.message(
      'Authentication',
      name: 'authTitle',
      desc: '',
      args: [],
    );
  }

  /// `You must authenticate to continue`
  String get mustAuthenticate {
    return Intl.message(
      'You must authenticate to continue',
      name: 'mustAuthenticate',
      desc: '',
      args: [],
    );
  }

  /// `Verifying identity...`
  String get authenticating {
    return Intl.message(
      'Verifying identity...',
      name: 'authenticating',
      desc: '',
      args: [],
    );
  }

  /// `✅ Access granted`
  String get accessGranted {
    return Intl.message(
      '✅ Access granted',
      name: 'accessGranted',
      desc: '',
      args: [],
    );
  }

  /// `Authentication failed`
  String get authFailed {
    return Intl.message(
      'Authentication failed',
      name: 'authFailed',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error`
  String get unexpectedError {
    return Intl.message(
      'Unexpected error',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `Authenticate`
  String get authenticate {
    return Intl.message(
      'Authenticate',
      name: 'authenticate',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get id {
    return Intl.message(
      'ID',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete code?`
  String get deleteConfirmationTitle {
    return Intl.message(
      'Delete code?',
      name: 'deleteConfirmationTitle',
      desc: '',
      args: [],
    );
  }

  /// `This action cannot be undone.`
  String get deleteConfirmationMessage {
    return Intl.message(
      'This action cannot be undone.',
      name: 'deleteConfirmationMessage',
      desc: '',
      args: [],
    );
  }

  /// `Code added successfully`
  String get codeAdded {
    return Intl.message(
      'Code added successfully',
      name: 'codeAdded',
      desc: '',
      args: [],
    );
  }

  /// `Code deleted successfully`
  String get codeDeleted {
    return Intl.message(
      'Code deleted successfully',
      name: 'codeDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Error adding the code`
  String get codeAddError {
    return Intl.message(
      'Error adding the code',
      name: 'codeAddError',
      desc: '',
      args: [],
    );
  }

  /// `Error deleting the code`
  String get codeDeleteError {
    return Intl.message(
      'Error deleting the code',
      name: 'codeDeleteError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
