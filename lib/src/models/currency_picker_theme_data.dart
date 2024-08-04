import 'package:flutter/material.dart';

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

  /// If null, the style will be set to [TextStyle(fontSize: 18);]
  final TextStyle? currencySignTextStyle;

  ///The flag  size.
  ///
  /// If null, set to 25
  final double flagSize;

  ///The flag image height.
  ///
  /// If null, set to 27
  final double flagHeight;

  ///The flag image width.
  ///
  /// If null, set to 25
  final double flagWidth;

  ///Flag padding
  ///
  final EdgeInsetsGeometry? flagPadding;

  ///The flag border radius.
  ///
  /// If null, set to 6.5
  final double? flagBorderRadius;

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

  const CurrencyPickerThemeData({
    this.shape,
    this.flagSize = 25,
    this.flagHeight = 32,
    this.flagWidth = 32,
    this.flagPadding,
    this.flagBorderRadius = 6.5,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.currencySignTextStyle,
    this.backgroundColor,
    this.bottomSheetHeight,
    this.searchIcon,
    this.borderColor,
    this.iconColor,
  });

  CurrencyPickerThemeData copyWith({
    ShapeBorder? shape,
    Color? backgroundColor,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
    TextStyle? currencySignTextStyle,
    double? flagSize,
    double? flagHeight,
    double? flagWidth,
    EdgeInsetsGeometry? flagPadding,
    double? flagBorderRadius,
    double? bottomSheetHeight,
    Icon? searchIcon,
    Color? borderColor,
    Color? iconColor,
  }) =>
      CurrencyPickerThemeData(
        shape: shape ?? this.shape,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        titleTextStyle: titleTextStyle ?? this.titleTextStyle,
        subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
        currencySignTextStyle: currencySignTextStyle ?? this.currencySignTextStyle,
        flagSize: flagSize ?? this.flagSize,
        flagHeight: flagHeight ?? this.flagHeight,
        flagWidth: flagWidth ?? this.flagWidth,
        flagPadding: flagPadding ?? this.flagPadding,
        flagBorderRadius: flagBorderRadius ?? this.flagBorderRadius,
        bottomSheetHeight: bottomSheetHeight ?? this.bottomSheetHeight,
        searchIcon: searchIcon ?? this.searchIcon,
        borderColor: borderColor ?? this.borderColor,
        iconColor: iconColor ?? this.iconColor,
      );
}
