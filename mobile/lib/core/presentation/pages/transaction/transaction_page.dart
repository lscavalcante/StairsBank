import 'package:flutter/material.dart';
import 'package:stairsbank/core/presentation/theme/text_custom.dart';
import 'package:stairsbank/core/presentation/theme/theme_colors.dart';
import 'package:stairsbank/core/presentation/theme/theme_constants.dart';
import 'package:stairsbank/core/shared/components/button/button.dart';
import 'package:flutter/services.dart' as services;
import 'package:stairsbank/core/shared/util/masks/money_text_input_formatter.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Scaffold(
        backgroundColor: ThemeColors.blueSemiLight,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Transaction"),
        ),
        bottomSheet: const Padding(
          padding: EdgeInsets.all(ThemeConstants.halfPadding),
          child: Button(
            child: Text("Transfer"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(ThemeConstants.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What is the transfer amount?",
                style: TextCustom(context).title.copyWith(),
              ),
              Text(
                "Avaible balance",
                style: TextCustom(context).info.copyWith(),
              ),
              TextFormField(
                autofocus: true,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: "How much do you want to transfer?",
                  hintText: "How much do you want to transfer?",
                ),
                inputFormatters: [
                  services.FilteringTextInputFormatter.digitsOnly,
                  CurrencyInputFormatter()
                ],
              ),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Enter the ID of the person.",
                  labelText:
                      "Enter the ID of the person you want to transfer to.",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
