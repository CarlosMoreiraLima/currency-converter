import 'package:currency_converter/app/components/currency_box.dart';
import 'package:currency_converter/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final logoPath = "assets/images/currency_logo.jpg";

  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  late HomeController homeController;

  @override
  initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 100, right: 150, left: 150),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(
                    logoPath,
                    width: 150,
                    height: 150,
                  ),
                ),
                CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  items: homeController.currencies,
                  controller: toText,
                  onChanged: (model) {
                    setState(
                      () {
                        homeController.toCurrency = homeController.currencies
                            .firstWhere((element) => element.name == model);
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
                CurrencyBox(
                  selectedItem: homeController.fromCurrency,
                  items: homeController.currencies,
                  controller: fromText,
                  onChanged: (model) {
                    setState(
                      () {
                        homeController.fromCurrency = homeController.currencies
                            .firstWhere((element) => element.name == model);
                      },
                    );
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  child: Text("Converter"),
                  onPressed: () {
                    homeController.convert();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
