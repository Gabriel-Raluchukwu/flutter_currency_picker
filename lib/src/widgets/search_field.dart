import 'package:flutter/material.dart';

import 'package:currency_picker/src/models/currency_picker_theme_data.dart';

typedef OnFilter = void Function(String query);

class SearchField extends StatelessWidget {
  final TextEditingController searchController;
  final String? label;
  final String? searchHint;
  final OnFilter filterSearchResults;
  final Color borderColor;
  final bool showClearSuffixIcon;
  final CurrencyPickerThemeData? theme;

  const SearchField({
    super.key,
    required this.searchController,
    required this.filterSearchResults,
    this.label,
    this.searchHint = "Search",
    required this.borderColor,
    this.showClearSuffixIcon = true,
    this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        labelText: label,
        hintText: searchHint,
        hintStyle: theme?.hintTextStyle,
        prefixIcon: theme?.searchIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: theme?.borderColor ?? borderColor,
          ),
        ),
        suffixIcon: showClearSuffixIcon
            ? IconButton(
                icon: Icon(
                  Icons.clear,
                  color: theme?.iconColor ?? borderColor,
                ),
                onPressed: () {
                  searchController.clear();
                  filterSearchResults("");
                },
              )
            : null,
      ),
      onChanged: filterSearchResults,
    );
  }
}
