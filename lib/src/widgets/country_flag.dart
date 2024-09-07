import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';

class Flag extends StatelessWidget {
  final String countryCode;
  final EdgeInsetsGeometry? padding;
  final double flagWidth;
  final double flagHeight;
  final double borderRadius;

  const Flag({
    super.key,
    required this.countryCode,
    this.padding,
    this.flagHeight = 24.0,
    this.flagWidth = 48.0,
    this.borderRadius = 6.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: CountryFlag.fromCountryCode(
        countryCode,
        width: flagWidth,
        height: flagHeight,
        shape: RoundedRectangle(borderRadius),
      ),
    );
  }
}
