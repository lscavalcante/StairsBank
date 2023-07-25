import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stairsbank/core/presentation/pages/transaction/transaction_page.dart';
import 'package:stairsbank/core/presentation/theme/text_custom.dart';
import 'package:stairsbank/core/presentation/theme/theme_colors.dart';

class OptionOperation extends StatelessWidget {
  const OptionOperation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context, CupertinoPageRoute(builder: (_) => TransactionPage()));
          },
          child: Container(
            width: 52,
            height: 45,
            decoration: BoxDecoration(
              color: ThemeColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(
                Icons.monetization_on_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
        Text(
          "Withdraw",
          style: TextCustom(context).normal.copyWith(fontSize: 10),
        )
      ],
    );
  }
}
