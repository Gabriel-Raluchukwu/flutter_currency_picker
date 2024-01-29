import 'package:flutter/material.dart';

import 'package:currency_picker/src/models/currency.dart';
import 'package:currency_picker/src/values/constants.dart';
import 'package:currency_picker/src/widgets/currency_flag.dart';
import 'package:currency_picker/src/models/currency_picker_theme_data.dart';

class CurrencyTile extends StatelessWidget {
  final Currency currency;
  final CurrencyPickerThemeData? theme;
  final bool showFlag;
  final bool useCountryFlag;
  final bool showCurrencyCode;
  final bool showCurrencyName;
  final ValueChanged<Currency> onSelect;

  const CurrencyTile({
    super.key,
    required this.currency,
    required this.onSelect,
    this.theme,
    this.showFlag = true,
    this.useCountryFlag = false,
    this.showCurrencyCode = true,
    this.showCurrencyName = true,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTextStyle = theme?.titleTextStyle ?? Constants.defaultTitleTextStyle;
    final TextStyle subtitleTextStyle =
        theme?.subtitleTextStyle ?? Constants.defaultSubtitleTextStyle(context);
    final currencySignTextStyle =
        theme?.currencySignTextStyle ?? Constants.defaultCurrencySignTextStyle;

    return Material(
      // Add Material Widget with transparent color
      // so the ripple effect of InkWell will show on tap
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onSelect(currency),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    if (showFlag) ...[
                      CurrencyFlag(
                        currency: currency,
                        theme: theme,
                        useCurrencyFlag: useCountryFlag,
                      ),
                      const SizedBox(width: 15),
                    ],
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (showCurrencyCode) ...[
                            Text(
                              currency.code,
                              style: titleTextStyle,
                            ),
                          ],
                          if (showCurrencyName) ...[
                            Text(
                              currency.name,
                              style: showCurrencyCode ? subtitleTextStyle : titleTextStyle,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  currency.symbol,
                  style: currencySignTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
