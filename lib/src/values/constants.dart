import 'package:flutter/material.dart';

class Constants {
  static TextStyle get defaultTitleTextStyle => const TextStyle(fontSize: 17);

  static TextStyle get defaultCurrencySignTextStyle => const TextStyle(fontSize: 18);

  static TextStyle defaultSubtitleTextStyle(BuildContext context) =>
      TextStyle(fontSize: 15, color: Theme.of(context).hintColor);
}
