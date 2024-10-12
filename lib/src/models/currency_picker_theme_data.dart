import 'package:flutter/material.dart';

import 'package:currency_picker/src/models/currency_tile_theme_data.dart';

class CurrencyPickerThemeData {
  ///  The currency bottom sheet's shape.
  final ShapeBorder? shape;

  /// The currency bottom sheet's background color.
  final Color? backgroundColor;

  ///The style to use for title text.
  ///
  /// If null, the style will be set to [TextStyle(fontSize: 17)]
  final TextStyle? titleTextStyle;

  ///The style to use for subtitle text.
  ///
  /// If null, the style will be set to [TextStyle(fontSize: 15, color: Theme.of(context).hintColor)]
  final TextStyle? subtitleTextStyle;

  ///The style to use for title text.
  ///
  /// If null, the style will be set to [TextStyle(fontSize: 17)]
  final TextStyle? hintTextStyle;

  /// If null, the style will be set to [TextStyle(fontSize: 18);]
  final TextStyle? currencySignTextStyle;

  ///Country list modal height
  ///
  /// By default it's fullscreen
  final double? bottomSheetHeight;

  ///Search textfield prefix icon
  ///
  final Icon? searchIcon;

  /// Input borderside color
  final Color? borderColor;

  /// Icon color
  final Color? iconColor;

  final CurrencyTileThemeData? currencyTileTheme;

  const CurrencyPickerThemeData({
    this.shape,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.hintTextStyle,
    this.currencySignTextStyle,
    this.backgroundColor,
    this.bottomSheetHeight,
    this.searchIcon,
    this.borderColor,
    this.iconColor,
    this.currencyTileTheme,
  });

  CurrencyPickerThemeData copyWith({
    ShapeBorder? shape,
    Color? backgroundColor,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
    TextStyle? currencySignTextStyle,
    double? bottomSheetHeight,
    Icon? searchIcon,
    Color? borderColor,
    Color? iconColor,
    CurrencyTileThemeData? currencyTileTheme,
  }) =>
      CurrencyPickerThemeData(
        shape: shape ?? this.shape,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        titleTextStyle: titleTextStyle ?? this.titleTextStyle,
        subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
        currencySignTextStyle: currencySignTextStyle ?? this.currencySignTextStyle,
        bottomSheetHeight: bottomSheetHeight ?? this.bottomSheetHeight,
        searchIcon: searchIcon ?? this.searchIcon,
        borderColor: borderColor ?? this.borderColor,
        iconColor: iconColor ?? this.iconColor,
        currencyTileTheme: currencyTileTheme ?? this.currencyTileTheme,
      );
}
