import 'package:currency_converter/app/controllers/home_controller.dart';
import 'package:currency_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText: toText, fromText: fromText);

  test("A função deve fornecer o valor da conversão de Real para Dolar", () {
    toText.text = '2.0';
    homeController.toCurrency = CurrencyModel(
      name: "Real",
      real: 1.0,
      dolar: 0.21,
      euro: 0.19,
      bitcoin: 0.0000072,
    );
    homeController.fromCurrency = CurrencyModel(
      name: "Dolar",
      real: 4.75,
      dolar: 1.0,
      euro: 0.91,
      bitcoin: 0.000034,
    );
    homeController.convert();
    expect(fromText.text, '0.42');
  });

  test("A função deve fornecer o valor da conversão de Dolar para Real", () {
    toText.text = '2.0';
    homeController.toCurrency = CurrencyModel(
      name: "Dolar",
      real: 4.75,
      dolar: 1.0,
      euro: 0.91,
      bitcoin: 0.000034,
    );
    homeController.fromCurrency = CurrencyModel(
      name: "Real",
      real: 1.0,
      dolar: 0.21,
      euro: 0.19,
      bitcoin: 0.0000072,
    );
    homeController.convert();
    expect(fromText.text, '9.50');
  });

  test("A função deve fornecer o valor da conversão de Real para Dolar com virgula", () {
    toText.text = '2,0';
    homeController.toCurrency = CurrencyModel(
      name: "Real",
      real: 1.0,
      dolar: 0.21,
      euro: 0.19,
      bitcoin: 0.0000072,
    );
    homeController.fromCurrency = CurrencyModel(
      name: "Dolar",
      real: 4.75,
      dolar: 1.0,
      euro: 0.91,
      bitcoin: 0.000034,
    );
    homeController.convert();
    expect(fromText.text, '0.42');
  });

  test("A função deve fornecer o valor da conversão de Dolar para Real com virgula", () {
    toText.text = '2,0';
    homeController.toCurrency = CurrencyModel(
      name: "Dolar",
      real: 4.75,
      dolar: 1.0,
      euro: 0.91,
      bitcoin: 0.000034,
    );
    homeController.fromCurrency = CurrencyModel(
      name: "Real",
      real: 1.0,
      dolar: 0.21,
      euro: 0.19,
      bitcoin: 0.0000072,
    );
    homeController.convert();
    expect(fromText.text, '9.50');
  });
}
