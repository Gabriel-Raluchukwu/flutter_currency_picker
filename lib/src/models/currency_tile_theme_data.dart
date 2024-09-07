import 'package:flutter/material.dart';

class CurrencyTileThemeData {
  /// Currency tile padding
  final EdgeInsetsGeometry? padding;

  /// Currency tile margin
  final EdgeInsetsGeometry? margin;

  /// Currency tile container decoration
  final BoxDecoration? decoration;

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

  CurrencyTileThemeData({
    this.padding,
    this.margin,
    this.decoration,
    this.flagSize = 24,
    this.flagHeight = 30,
    this.flagWidth = 48,
    this.flagPadding,
    this.flagBorderRadius = 4.5,
  });

  CurrencyTileThemeData copyWith({
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxDecoration? decoration,
    double? flagSize,
    double? flagHeight,
    double? flagWidth,
    EdgeInsetsGeometry? flagPadding,
    double? flagBorderRadius,
  }) =>
      CurrencyTileThemeData(
        padding: padding ?? this.padding,
        margin: margin ?? this.margin,
        decoration: decoration ?? this.decoration,
        flagSize: flagSize ?? this.flagSize,
        flagHeight: flagHeight ?? this.flagHeight,
        flagWidth: flagWidth ?? this.flagWidth,
        flagPadding: flagPadding ?? this.flagPadding,
        flagBorderRadius: flagBorderRadius ?? this.flagBorderRadius,
      );
}
