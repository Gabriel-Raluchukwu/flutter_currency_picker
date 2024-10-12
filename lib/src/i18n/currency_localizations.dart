import 'package:flutter/widgets.dart';

import 'package:currency_picker/src/i18n/languages.dart';
import 'package:currency_picker/src/res/strings/de.dart';
import 'package:currency_picker/src/res/strings/en.dart';
import 'package:currency_picker/src/res/strings/es.dart';
import 'package:currency_picker/src/res/strings/fi.dart';
import 'package:currency_picker/src/res/strings/fr.dart';
import 'package:currency_picker/src/res/strings/it.dart';
import 'package:currency_picker/src/res/strings/nl.dart';
import 'package:currency_picker/src/res/strings/pl.dart';
import 'package:currency_picker/src/res/strings/ru.dart';
import 'package:currency_picker/src/res/strings/sv.dart';
import 'package:currency_picker/src/i18n/currency_localizations_delegate.dart';

class CurrencyLocalizations {
  final Locale locale;

  CurrencyLocalizations(this.locale);

  static CurrencyLocalizations of(BuildContext context) {
    return Localizations.of<CurrencyLocalizations>(context, CurrencyLocalizations)!;
  }

  /// A [LocalizationsDelegate] that uses [_CurrencyLocalizationsDelegate.load]
  /// to create an instance of this class.
  static const LocalizationsDelegate<CurrencyLocalizations> delegate =
      CurrencyLocalizationsDelegate();

  String? name(String currencyCode) {
    switch (locale.languageCode) {
      case Language.dutch:
        return names_nl[currencyCode];
      case Language.finnish:
        return names_fi[currencyCode];
      case Language.french:
        return names_fr[currencyCode];
      case Language.german:
        return names_de[currencyCode];
      case Language.italian:
        return names_it[currencyCode];
      case Language.polish:
        return names_pl[currencyCode];
      case Language.russian:
        return names_ru[currencyCode];
      case Language.spanish:
        return names_es[currencyCode];
      case Language.swedish:
        return names_sv[currencyCode];
      case Language.english:
      default:
        return names_en[currencyCode];
    }
  }

  String? pluralName(String currencyCode) {
    switch (locale.languageCode) {
      case Language.dutch:
        return pluralNames_nl[currencyCode];
      case Language.finnish:
        return pluralNames_fi[currencyCode];
      case Language.french:
        return pluralNames_fr[currencyCode];
      case Language.german:
        return pluralNames_de[currencyCode];
      case Language.italian:
        return pluralNames_it[currencyCode];
      case Language.polish:
        return pluralNames_pl[currencyCode];
      case Language.russian:
        return pluralNames_ru[currencyCode];
      case Language.spanish:
        return pluralNames_es[currencyCode];
      case Language.swedish:
        return pluralNames_sv[currencyCode];
      case Language.english:
      default:
        return pluralNames_en[currencyCode];
    }
  }
}
