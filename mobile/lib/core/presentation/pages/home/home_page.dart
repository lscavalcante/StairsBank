import 'package:flutter/material.dart';
import 'package:stairsbank/core/presentation/theme/spaces.dart';
import 'package:stairsbank/core/presentation/theme/text_custom.dart';
import 'package:stairsbank/core/presentation/theme/theme_colors.dart';
import 'package:stairsbank/core/presentation/theme/theme_constants.dart';
import 'package:stairsbank/core/shared/components/options/option_operation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Scaffold(
        backgroundColor: ThemeColors.blueSemiLight,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(ThemeConstants.padding),
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ThemeColors.secondary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Welcome Back ",
                            style: TextCustom(context).info,
                          ),
                          Text(
                            "Rene Wells ",
                            style: TextCustom(context).normal.copyWith(
                                  color: ThemeColors.white,
                                ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.notifications_outlined,
                        color: ThemeColors.white,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Available Balance",
                        style: TextCustom(context).normal.copyWith(
                              color: ThemeColors.white,
                            ),
                      ),
                      Text(
                        "\$17,000",
                        style: TextCustom(context).normal.copyWith(
                              color: ThemeColors.white,
                            ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(ThemeConstants.padding),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Operations",
                        style: TextCustom(context).title,
                      ),
                      const SpacerVertical.normal(),
                      SizedBox(
                        height: 70,
                        child: ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return const OptionOperation();
                          },
                          itemCount: 2,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 24);
                          },
                        ),
                      ),
                      Text(
                        "Recent Transactions",
                        style: TextCustom(context).title,
                      ),
                      const SpacerVertical.normal(),
                      ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              tileColor: Colors.white,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              title: Text(
                                "Paypall",
                                style: TextCustom(context).normal,
                              ),
                              subtitle: Text(
                                "+0.54915 BTC",
                                style: TextCustom(context).info,
                              ),
                              trailing: Text(
                                "24 Mar 2022",
                                style: TextCustom(context)
                                    .normal
                                    .copyWith(fontSize: 11),
                              ),
                            ),
                          );
                        },
                        itemCount: 10,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 10);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
