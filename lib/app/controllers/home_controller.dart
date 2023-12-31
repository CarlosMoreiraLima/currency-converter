import 'package:currency_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  late List<CurrencyModel> currencies;

  final TextEditingController toText;
  final TextEditingController fromText;

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double result = 0;

    if (fromCurrency.name == 'Real') {
      result = value * toCurrency.real;
    }
    if (fromCurrency.name == 'Dolar') {
      result = value * toCurrency.dolar;
    }
    if (fromCurrency.name == 'Euro') {
      result = value * toCurrency.euro;
    }
    if (fromCurrency.name == 'Bitcoin') {
      result = value * toCurrency.bitcoin;
    }

    fromText.text = result.toStringAsFixed(2);
  }
}
