import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:currency_picker/src/models/currency.dart';
import 'package:currency_picker/src/currency_service.dart';
import 'package:currency_picker/src/widgets/search_field.dart';
import 'package:currency_picker/src/widgets/currency_tile.dart';
import 'package:currency_picker/src/i18n/currency_localizations.dart';
import 'package:currency_picker/src/models/currency_picker_theme_data.dart';

class CurrencyListView extends StatefulWidget {
  /// Called when a currency is select.
  ///
  /// The currency picker passes the new value to the callback.
  final ValueChanged<Currency> onSelect;

  /// The Currencies that will appear at the top of the list (optional).
  ///
  /// It takes a list of Currency code.
  final List<String>? favorite;

  /// Can be used to uses filter the Currency list (optional).
  ///
  /// It takes a list of Currency code.
  final List<String>? currencyFilter;

  /// Shows flag for each currency (optional).
  ///
  /// Defaults true.
  final bool showFlag;

  /// Use country flag package to display flags instead (optional).
  final bool useCountryFlag;

  /// Shows currency name (optional).
  /// [showCurrencyName] and [showCurrencyCode] cannot be both false
  ///
  /// Defaults true.
  final bool showCurrencyName;

  /// Shows currency code (optional).
  /// [showCurrencyCode] and [showCurrencyName] cannot be both false
  ///
  /// Defaults true.
  final bool showCurrencyCode;

  /// To disable the search TextField (optional).
  final bool showSearchField;

  final String? label;

  /// Hint of the search TextField (optional).
  ///
  /// Defaults Search.
  final String? searchHint;

  final bool showClearSuffix;

  final ScrollController? controller;

  final ScrollPhysics? physics;

  /// An optional argument for for customizing the
  /// currency list bottom sheet.
  final CurrencyPickerThemeData? theme;

  const CurrencyListView({
    super.key,
    required this.onSelect,
    this.favorite,
    this.currencyFilter,
    this.showSearchField = true,
    this.label,
    this.searchHint,
    this.showClearSuffix = false,
    this.showCurrencyCode = true,
    this.showCurrencyName = true,
    this.showFlag = true,
    this.useCountryFlag = false,
    this.physics,
    this.controller,
    this.theme,
  });

  @override
  _CurrencyListViewState createState() => _CurrencyListViewState();
}

class _CurrencyListViewState extends State<CurrencyListView> {
  final CurrencyService _currencyService = CurrencyService();

  late final CurrencyLocalizations _localizations;
  late List<Currency> _filteredList;
  late List<Currency> _currencyList;
  List<Currency>? _favoriteList;

  late TextEditingController _searchController;

  Color defaultColor = const Color(0xFF8C98A8).withOpacity(0.2);

  void _filterSearchResults(String query) {
    List<Currency> searchResult = <Currency>[];
    if (query.isEmpty) {
      searchResult.addAll(_currencyList);
    } else {
      searchResult = _currencyList.where((c) => c.startsWith(query, _localizations)).toList();
    }

    setState(() => _filteredList = searchResult);
  }

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _currencyList = _currencyService.getAll();
    _filteredList = <Currency>[];

    if (widget.currencyFilter != null) {
      final List<String> currencyFilter =
          widget.currencyFilter!.map((code) => code.toUpperCase()).toList();

      _currencyList.removeWhere((element) => !currencyFilter.contains(element.code));
    }

    if (widget.favorite != null) {
      _favoriteList = _currencyService.findCurrenciesByCode(widget.favorite!);
    }

    _filteredList.addAll(_currencyList);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _localizations = CurrencyLocalizations.of(context);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.theme?.backgroundColor,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: widget.showSearchField
                ? SearchField(
                    searchController: _searchController,
                    label: widget.label,
                    searchHint: widget.searchHint,
                    theme: widget.theme,
                    borderColor: defaultColor,
                    filterSearchResults: _filterSearchResults,
                    showClearSuffixIcon: widget.showClearSuffix,
                  )
                : Container(),
          ),
          Expanded(
            child: ListView(
              physics: widget.physics,
              children: [
                if (_favoriteList != null) ...[
                  ..._favoriteList!.map<Widget>(
                    (currency) => CurrencyTile(
                      currency: currency,
                      onSelect: widget.onSelect,
                      showFlag: widget.showFlag,
                      useCountryFlag: widget.useCountryFlag,
                      showCurrencyName: widget.showCurrencyName,
                      showCurrencyCode: widget.showCurrencyCode,
                      theme: widget.theme,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(thickness: 1),
                  ),
                ],
                ..._filteredList.map<Widget>(
                  (currency) => CurrencyTile(
                    currency: currency,
                    onSelect: widget.onSelect,
                    showFlag: widget.showFlag,
                    useCountryFlag: widget.useCountryFlag,
                    showCurrencyName: widget.showCurrencyName,
                    showCurrencyCode: widget.showCurrencyCode,
                    theme: widget.theme,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CupertinoCurrencyListView extends StatefulWidget {
  /// Called when a currency is select.
  ///
  /// The currency picker passes the new value to the callback.
  final ValueChanged<Currency> onSelect;

  /// The Currencies that will appear at the top of the list (optional).
  ///
  /// It takes a list of Currency code.
  final List<String>? favorite;

  /// Can be used to uses filter the Currency list (optional).
  ///
  /// It takes a list of Currency code.
  final List<String>? currencyFilter;

  /// Shows flag for each currency (optional).
  ///
  /// Defaults true.
  final bool showFlag;

  /// Use country flag package to display flags instead (optional).
  final bool useCountryFlag;

  /// Shows currency name (optional).
  /// [showCurrencyName] and [showCurrencyCode] cannot be both false
  ///
  /// Defaults true.
  final bool showCurrencyName;

  /// Shows currency code (optional).
  /// [showCurrencyCode] and [showCurrencyName] cannot be both false
  ///
  /// Defaults true.
  final bool showCurrencyCode;

  /// To disable the search TextField (optional).
  final bool showSearchField;

  final String? label;

  /// Hint of the search TextField (optional).
  ///
  /// Defaults Search.
  final String? searchHint;

  final ScrollController? controller;

  final ScrollPhysics? physics;

  final BoxDecoration? searchInputDecoration;

  /// An optional argument for for customizing the
  /// currency list bottom sheet.
  final CurrencyPickerThemeData? theme;

  const CupertinoCurrencyListView({
    super.key,
    required this.onSelect,
    this.favorite,
    this.currencyFilter,
    this.showSearchField = true,
    this.label,
    this.searchHint,
    this.showCurrencyCode = true,
    this.showCurrencyName = true,
    this.showFlag = true,
    this.useCountryFlag = false,
    this.physics,
    this.controller,
    this.searchInputDecoration,
    this.theme,
  });

  @override
  _CupertinoCurrencyListViewState createState() => _CupertinoCurrencyListViewState();
}

class _CupertinoCurrencyListViewState extends State<CupertinoCurrencyListView> {
  final CurrencyService _currencyService = CurrencyService();

  late final CurrencyLocalizations _localizations;
  late List<Currency> _filteredList;
  late List<Currency> _currencyList;
  List<Currency>? _favoriteList;

  TextEditingController? _searchController;

  Color defaultColor = const Color(0xFF8C98A8).withOpacity(0.2);

  void _filterSearchResults(String query) {
    List<Currency> searchResult = <Currency>[];
    if (query.isEmpty) {
      searchResult.addAll(_currencyList);
    } else {
      searchResult = _currencyList.where((c) => c.startsWith(query, _localizations)).toList();
    }

    setState(() => _filteredList = searchResult);
  }

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _currencyList = _currencyService.getAll();
    _filteredList = <Currency>[];

    if (widget.currencyFilter != null) {
      final List<String> currencyFilter =
          widget.currencyFilter!.map((code) => code.toUpperCase()).toList();
      _currencyList.removeWhere((element) => !currencyFilter.contains(element.code));
    }

    if (widget.favorite != null) {
      _favoriteList = _currencyService.findCurrenciesByCode(widget.favorite!);
    }

    _filteredList.addAll(_currencyList);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _localizations = CurrencyLocalizations.of(context);
  }

  @override
  void dispose() {
    _searchController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.theme?.backgroundColor,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 6.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: widget.showSearchField
                ? CupertinoSearchTextField(
                    controller: _searchController,
                    decoration: widget.searchInputDecoration,
                    placeholder: widget.searchHint,
                    prefixIcon: widget.theme?.searchIcon ??
                        Icon(CupertinoIcons.search, color: widget.theme?.iconColor ?? defaultColor),
                    onChanged: _filterSearchResults,
                    onSubmitted: _filterSearchResults,
                  )
                : Container(),
          ),
          Expanded(
            child: ListView(
              physics: widget.physics,
              children: [
                if (_favoriteList != null) ...[
                  ..._favoriteList!.map<Widget>(
                    (currency) => CurrencyTile(
                      currency: currency,
                      onSelect: widget.onSelect,
                      showFlag: widget.showFlag,
                      useCountryFlag: widget.useCountryFlag,
                      showCurrencyName: widget.showCurrencyName,
                      showCurrencyCode: widget.showCurrencyCode,
                      theme: widget.theme,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(thickness: 1),
                  ),
                ],
                ..._filteredList.map<Widget>(
                  (currency) => CurrencyTile(
                    currency: currency,
                    onSelect: widget.onSelect,
                    showFlag: widget.showFlag,
                    useCountryFlag: widget.useCountryFlag,
                    showCurrencyName: widget.showCurrencyName,
                    showCurrencyCode: widget.showCurrencyCode,
                    theme: widget.theme,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
