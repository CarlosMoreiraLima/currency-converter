class CurrencyModel {
  final String name;
  final double real;
  final double dolar;
  final double euro;
  final double bitcoin;

  CurrencyModel(
      {required this.name,
      required this.real,
      required this.dolar,
      required this.euro,
      required this.bitcoin});

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel(
        name: "Real",
        real: 1.0,
        dolar: 0.21,
        euro: 0.19,
        bitcoin: 0.0000072,
      ),
      CurrencyModel(
        name: "Dolar",
        real: 4.75,
        dolar: 1.0,
        euro: 0.91,
        bitcoin: 0.000034,
      ),
      CurrencyModel(
        name: "Euro",
        real: 5.25,
        dolar: 1.10,
        euro: 1.0,
        bitcoin: 0.000038,
      ),
      CurrencyModel(
        name: "Bitcoin",
        real: 138533.09,
        dolar: 138533.09,
        euro: 138533.09,
        bitcoin: 1.0,
      ),
    ];
  }
}
