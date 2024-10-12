import 'package:flutter/widgets.dart';

import 'package:currency_picker/src/i18n/languages.dart';
import 'package:currency_picker/src/i18n/currency_localizations.dart';

class CurrencyLocalizationsDelegate extends LocalizationsDelegate<CurrencyLocalizations> {
  const CurrencyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return [
      Language.german,
      Language.english,
      Language.spanish,
      Language.finnish,
      Language.french,
      Language.italian,
      Language.dutch,
      Language.polish,
      Language.swedish,
      Language.russian,
    ].contains(locale.languageCode);
  }

  @override
  Future<CurrencyLocalizations> load(Locale locale) {
    final CurrencyLocalizations localizations = CurrencyLocalizations(locale);
    return Future.value(localizations);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<CurrencyLocalizations> old) => false;
}
