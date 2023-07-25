import 'package:flutter/material.dart';
import 'package:stairsbank/core/presentation/theme/text_custom.dart';
import 'package:stairsbank/core/presentation/theme/theme_colors.dart';
import 'package:stairsbank/core/shared/components/button/button.dart';
import 'package:stairsbank/core/shared/components/options/option_operation.dart';

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
          title: Text("Transaction"),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Button(
            child: Text("Transfer"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "How much do you want to transfer?",
                  hintText: "How much do you want to transfer?",
                ),
              ),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter the ID of the person.",
                    labelText:
                        "Enter the ID of the person you want to transfer to."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
