import 'package:flutter/material.dart';

import 'package:currency_picker/currency_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo for currency picker package',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;

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
                    showFlag: true,
                    useCountryFlag: true,
                    showSearchField: true,
                    showCurrencyName: true,
                    showCurrencyCode: true,
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
                        title: Text("Currency List"),
                      ),
                      body: _buildAdaptiveCurrencyListView(platform),
                    ),
                  ),
                ),
                child: const Text("Show full Page picker"),
              )
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
        theme: const CurrencyPickerThemeData(
          borderColor: Colors.black,
          flagPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        ),
      );
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return CupertinoCurrencyListView(
        onSelect: (value) {},
        useCountryFlag: true,
      );
    default:
      return Placeholder();
  }
}
