import 'package:flutter/material.dart';

import 'package:currency_picker/src/models/currency.dart';
import 'package:currency_picker/src/currency_list_view.dart';
import 'package:currency_picker/src/models/currency_picker_theme_data.dart';

void showCurrencyListBottomSheet({
  required BuildContext context,
  required ValueChanged<Currency> onSelect,
  Locale? locale,
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
  final ShapeBorder shape = theme?.shape ??
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      );

  Widget builder = _builder(
    context,
    onSelect,
    height,
    favorite,
    currencyFilter,
    searchHint,
    physics,
    showSearchField,
    showFlag,
    useCountryFlag,
    showCurrencyName,
    showCurrencyCode,
    theme,
  );

  if (locale != null) {
    builder = Localizations.override(
      context: context,
      locale: locale,
      child: builder,
    );
  }

  showModalBottomSheet<dynamic>(
    context: context,
    isScrollControlled: true,
    shape: shape,
    useRootNavigator: useRootNavigator,
    backgroundColor: theme?.backgroundColor,
    builder: (_) => builder,
  ).whenComplete(() {
    if (onDismiss != null) {
      onDismiss();
    }
  });
}

Widget _builder(
  BuildContext context,
  ValueChanged<Currency> onSelect,
  double? height,
  List<String>? favorite,
  List<String>? currencyFilter,
  String? searchHint,
  ScrollPhysics? physics,
  bool showSearchField,
  bool showFlag,
  bool useCountryFlag,
  bool showCurrencyName,
  bool showCurrencyCode,
  CurrencyPickerThemeData? currencyPickerTheme,
) {
  final device = MediaQuery.of(context).size.height;
  final statusBarHeight = MediaQuery.of(context).padding.top;
  final defaultHeight =
      currencyPickerTheme?.bottomSheetHeight ?? device - (statusBarHeight + (kToolbarHeight / 1.5));

  final ThemeData theme = Theme.of(context);
  switch (theme.platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return SizedBox(
        height: height ?? defaultHeight,
        child: CurrencyListView(
          onSelect: onSelect,
          searchHint: searchHint,
          showSearchField: showSearchField,
          showFlag: showFlag,
          useCountryFlag: useCountryFlag,
          showCurrencyName: showCurrencyName,
          showCurrencyCode: showCurrencyCode,
          favorite: favorite,
          currencyFilter: currencyFilter,
          physics: physics,
          theme: currencyPickerTheme,
        ),
      );
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return SizedBox(
        height: height ?? defaultHeight,
        child: CupertinoCurrencyListView(
          onSelect: onSelect,
          searchHint: searchHint,
          showSearchField: showSearchField,
          showFlag: showFlag,
          useCountryFlag: useCountryFlag,
          showCurrencyName: showCurrencyName,
          showCurrencyCode: showCurrencyCode,
          favorite: favorite,
          currencyFilter: currencyFilter,
          physics: physics,
          theme: currencyPickerTheme,
        ),
      );
  }
}
