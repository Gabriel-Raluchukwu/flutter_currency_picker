library currency_picker;

import 'package:flutter/material.dart';

import 'package:currency_picker/src/models/currency.dart';
import 'package:currency_picker/src/models/currency_picker_theme_data.dart';
import 'package:currency_picker/src/currency_list_bottom_sheet.dart' as currency_list;

export 'package:currency_picker/src/models/currency.dart';
export 'package:currency_picker/src/currency_service.dart';
export 'package:currency_picker/src/utils/currency_utils.dart';
export 'package:currency_picker/src/widgets/currency_tile.dart';
export 'package:currency_picker/src/models/currency_picker_theme_data.dart';

/// Currency list view
export 'package:currency_picker/src/currency_list_view.dart';

/// Currency flag
export 'package:currency_picker/src/widgets/currency_flag.dart';

/// Show currency picker
///
///  `onSelect`: Called when a currency is select. The currency picker passes the new value to the callback (required)
///
///  `showFlag`: Shows flag for each currency. Default value true (optional).
///
///  `useCountryFlag`: Uses CountryFlag package when building flags. Default value false (optional).
///
///  `searchHint`: Option to customize hint of the search TextField (optional).
///
///  `showCurrencyName`: Option to show/hide the currency name, default value true (optional).
///
///  `showCurrencyCode`: Option to show/hide the currency code, default value true (optional).
///
///  `currencyFilter`: Can be used to uses filter the Currency list (optional).
///
///  `favorite`: The Currencies that will appear at the top of the list (optional).
///
///  `theme`: can be used to customizing the country list bottom sheet (optional).
///
///  `useRootNavigator`: ensures that the root navigator is used to
///  display the [BottomSheet] when set to `true`. This is useful in the case
///  that a modal [BottomSheet] needs to be displayed above all other content
///  but the caller is inside another [Navigator].
///
/// This example demonstrates how to use `showCurrencyPicker`
/// ```dart
/// showCurrencyPicker(
///    context: context,
///    showFlag: true,
///    showCurrencyName: true,
///    showCurrencyCode: true,
///    onSelect: (Currency currency) {
///       print('Select currency: ${currency.name}');
///    },
///    currencyFilter: <String>['EUR', 'GBP', 'USD', 'AUD', 'CAD', 'JPY', 'HKD', 'CHF', 'SEK', 'ILS'],
/// );
/// ```
void showCurrencyPicker({
  required BuildContext context,
  required ValueChanged<Currency> onSelect,
  VoidCallback? onDismiss,
  double? height,
  List<String>? favorite,
  List<String>? currencyFilter,
  String? searchHint,
  bool showSearchField = true,
  bool showFlag = true,
  bool useCountryFlag = false,
  bool showCurrencyName = true,
  bool showCurrencyCode = true,
  bool useRootNavigator = false,
  ScrollPhysics? physics,
  CurrencyPickerThemeData? theme,
}) {
  assert(
    showCurrencyName || showCurrencyCode,
    'showCurrencyName and showCurrencyCode cannot be both false',
  );
  currency_list.showCurrencyListBottomSheet(
    context: context,
    onSelect: onSelect,
    onDismiss: onDismiss,
    height: height,
    showSearchField: showSearchField,
    searchHint: searchHint,
    showFlag: showFlag,
    useCountryFlag: useCountryFlag,
    showCurrencyName: showCurrencyName,
    showCurrencyCode: showCurrencyCode,
    useRootNavigator: useRootNavigator,
    favorite: favorite,
    currencyFilter: currencyFilter,
    theme: theme,
    physics: physics,
  );
}
