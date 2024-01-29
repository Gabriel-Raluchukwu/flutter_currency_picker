import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';

import 'package:currency_picker/src/models/currency.dart';
import 'package:currency_picker/src/utils/extensions.dart';
import 'package:currency_picker/src/utils/currency_utils.dart';
import 'package:currency_picker/src/models/currency_picker_theme_data.dart';

class CurrencyFlag extends StatelessWidget {
  final Currency currency;
  final CurrencyPickerThemeData? theme;
  final bool useCurrencyFlag;

  const CurrencyFlag({
    super.key,
    required this.currency,
    this.useCurrencyFlag = false,
    this.theme,
  });

  Widget _showImage(String image, {CurrencyPickerThemeData? theme}) {
    return Container(
      padding: theme?.flagPadding,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        child: Image.asset(
          image.imagePath,
          package: "currency_picker",
          width: theme?.flagWidth ?? 48,
          height: theme?.flagHeight ?? 24,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (currency.flag == null) {
      return _showImage("no_flag.png", theme: theme);
    }

    if (currency.isFlagImage) {
      return _showImage(currency.flag!, theme: theme);
    }

    return useCurrencyFlag
        ? Container(
            padding: theme?.flagPadding,
            child: CountryFlag.fromCountryCode(
              CurrencyUtils.currencyFlagToCountryCode(currency),
              width: theme?.flagWidth ?? 48,
              height: theme?.flagHeight ?? 24,
              borderRadius: theme?.flagBorderRadius ?? 6.5,
            ),
          )
        : Container(
            padding: theme?.flagPadding,
            child: Text(
              CurrencyUtils.currencyToEmoji(currency),
              style: TextStyle(
                fontSize: theme?.flagSize ?? 25,
              ),
            ),
          );
  }
}
