import 'package:flutter/material.dart';

import 'package:country_flags/country_flags.dart';

const double _kDefaultFlagHeight = 24.0;
const double _kDefaultFlagWidth = 48.0;
const double _kDefaultBorderRaius = 6.5;

class Flag extends StatelessWidget {
  final String countryCode;
  final EdgeInsetsGeometry? padding;
  final double? flagWidth;
  final double? flagHeight;
  final double? borderRadius;
  final Shape? shape;

  const Flag({
    super.key,
    required this.countryCode,
    this.padding,
    this.flagHeight,
    this.flagWidth,
    this.borderRadius,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: CountryFlag.fromCountryCode(
        countryCode,
        theme: ImageTheme(
          height: flagHeight ?? _kDefaultFlagHeight,
          width: flagWidth ?? _kDefaultFlagWidth,
          shape: shape ?? RoundedRectangle(borderRadius ?? _kDefaultBorderRaius),
        ),
      ),
    );
  }
}
