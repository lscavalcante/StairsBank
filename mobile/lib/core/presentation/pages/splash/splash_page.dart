import 'package:flutter/material.dart';
import 'package:stairsbank/core/presentation/theme/text_custom.dart';
import 'package:stairsbank/core/presentation/theme/theme_colors.dart';
import 'package:stairsbank/core/shared/components/button/button.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: ThemeColors.blueLight,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset(
                    "assets/images/woman.png",
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text.rich(
                  TextSpan(
                    text: "Experience the ",
                    style: TextStyle(fontSize: 28, letterSpacing: 2),
                    children: [
                      TextSpan(
                        text: "easier way ",
                        style: TextStyle(
                          color: Color(0xFFFB847C),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFFB847C),
                        ),
                      ),
                      TextSpan(
                        text: "for transaction!",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Connect your money to your friends & brands."),
                const SizedBox(height: 10),
                Button(
                  child: Text(
                    "Get Started",
                    style: TextCustom(context).span,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
