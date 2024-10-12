import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:currency_picker/currency_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale("fi", ""),
      title: 'Demo for currency picker package',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      localizationsDelegates: const [
        CurrencyLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", ""),
        Locale("de", ""),
        Locale("nl", ""),
        Locale("fr", ""),
        Locale("fi", ""),
        Locale("pl", ""),
        Locale("es", ""),
        Locale("sv", ""),
        Locale("it", ""),
        Locale("ru", ""),
      ],
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    return Scaffold(
      appBar: AppBar(title: const Text('Demo for currency picker')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showCurrencyPicker(
                    context: context,
                    useCountryFlag: true,
                    onSelect: (Currency currency) {
                      print('Select currency: ${currency.name}');
                      Navigator.of(context).pop();
                    },
                    onDismiss: () {
                      print("Dismissed");
                    },
                    favorite: ['SEK'],
                  );
                },
                child: const Text("Show currency picker"),
              ),
              const SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: const Text("Currency List"),
                      ),
                      body: _buildAdaptiveCurrencyListView(platform),
                    ),
                  ),
                ),
                child: const Text("Show full Page picker"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildAdaptiveCurrencyListView(TargetPlatform platform) {
  switch (platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return CurrencyListView(
        onSelect: (value) {},
        useCountryFlag: true,
        showClearSuffix: true,
        theme: CurrencyPickerThemeData(
          borderColor: Colors.black,
          currencyTileTheme: CurrencyTileThemeData(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            flagPadding: const EdgeInsets.symmetric(horizontal: 8.0),
          ),
          searchIcon: const Icon(Icons.search),
        ),
      );
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return CupertinoCurrencyListView(
        onSelect: (value) {},
        useCountryFlag: true,
      );
    default:
      return const Placeholder();
  }
}
