import 'package:currency_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  final void Function(String?)? onChanged;

  const CurrencyBox({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 65,
            child: DropdownButton<String>(
              underline: Container(height: 1, color: Colors.amber),
              isExpanded: true,
              icon: const Icon(
                Icons.currency_exchange,
                color: Colors.amber,
              ),
              hint: const Text("Escolha a Moeda"),
              value: selectedItem.name,
              items: items
                  .map(
                    (options) => DropdownMenuItem(
                      value: options.name,
                      child: Text(options.name),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
          width: 50,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            keyboardType: const TextInputType.numberWithOptions(
              signed: true,
              decimal: true,
            ),
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
            ),
            controller: controller,
          ),
        )
      ],
    );
  }
}
